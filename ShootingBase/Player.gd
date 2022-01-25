extends KinematicBody2D

#　特記事項　===================================================================
#色々書いてあるがコメントに書いた通りである。
#当たり判定の処理は他にいい方法があるかもしれない(知っている人いたら教えて下さい)
#=============================================================================

var shot = preload("res://Shot.tscn")	#Playerが「Shot.tscn」を使用するので事前読み込みしておく
var speed = 250							#Playerの移動速度
var shottime = 8						#ショットの発射間隔を調整するための変数

#プレイヤーの移動処理(W、A、S、Dキーで移動)
func _physics_process(delta):
	var vec = Vector2()								#Vector2型の変数を用意
	if Input.is_action_pressed("ui_right"):			#Dキーが押されていたら
		vec.x += 1									#Playerのpositionをx方向にプラス
		$Sprite.frame = 2							#Player画像を2に切り替える
	elif Input.is_action_just_released("ui_right"):	#Dキーが離されると
		$Sprite.frame = 1;							#Player画像を1に戻す
		
	if Input.is_action_pressed("ui_left"):			#同様に左のときの処理
		vec.x -= 1
		$Sprite.frame = 0
	elif Input.is_action_just_released("ui_left"):
		$Sprite.frame = 1;

	if Input.is_action_pressed("ui_down"):			#下に移動
		vec.y += 1
	if Input.is_action_pressed("ui_up"):			#上に移動
		vec.y -= 1
	
	#ここででベクトルを正規化(ベクトルの方向を保ったまま長さを1に戻す)しspeedを掛けている。
	#正規化する理由は例えば、斜めの移動のときに「x」と「y」の移動量が両方足されて上下左右よりも移動が速くなるのを一定にするためである
	#(昔のゲームは斜めの移動が速かったがそれも悪くない)
	vec = vec.normalized() * speed
	
	#Playerが画面外に出ないようにする処理
	#clampは組み込み関数で「0～画面横幅」にPlayerの「position.x」や「y」が収まる処理を行っている
	position.x = clamp(position.x, 0, Global.view_w)
	position.y = clamp(position.y, 0, Global.view_h)

	#ショットを発射する処理	(spaceキーで発射)
	if Input.is_action_pressed("ui_select") and shottime < 0:	#spaceキーが押され、shottimeが0以下なら
		shottime = 8				#shottimeを8に戻す		
		var s = shot.instance()		#shotのインスタンスを作成(複製)
		s.start(position)			#ショットの発生位置をプレイヤーの位置に設定
		get_parent().add_child(s)	#子として追加する
									#(インスタンスを作成しただけではシーンに追加されておらず表示されないためここで追加)
	
	#PlayerがEnemyに当たったときの処理	
	var col = move_and_collide(vec * delta)	#衝突情報をcolに入れる(ベクトルにdeltaを掛けたその瞬間の情報を格納している？)
	if col:									#衝突情報があれば
		if col.collider.has_method("hit"):	#「hit」関数を持つやつがいれば(例えばEnemy)
			Global.score -= 10				#スコア減点
			col.collider.hit()				#「hit」関数を呼び出す
		if col.collider.has_method("hitp"):	#「hitp」関数を持つやつがいれば(例えばFire)
			Global.score -= 10				#スコア減点
			col.collider.hitp()				#「hit」関数を呼び出す
		
	shottime -= 1	#shottimeを1ずつ減らす
