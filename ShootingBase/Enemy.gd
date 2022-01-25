extends KinematicBody2D

#　特記事項　===================================================================
#コメントに書いた通りであるが、敵をrotateで継続的に回転させているのと、
#敵がプレイヤーに向けて一定間隔で狙い弾を撃っているところがポイント。
#狙い弾の狙う処理は「fire.gd」に記載
#=============================================================================

var speed = 2							#敵の移動スピード
var firetime = 100
var bomb = preload("res://Bomb.tscn")	#Enemy.tscn内で「Bomb.tscn」を使用するため事前読み込み
var fire = preload("res://Fire.tscn")

#初期化
func start(pos):						
	position.x = pos				#x座標を指定
	position.y = 0					#y座標は0
	

#メインプロセス
func _physics_process(delta):
	position.y += speed				#y座標にspeedを足す
	rotate(-0.1)					#反時計回りに回転させる
	if position.y > Global.view_h:	#画面縦幅を超えたら
		Global.score -= 5			#スコアを減点
		queue_free()				#敵削除
		
	#ファイアーを発射する処理	
	if firetime < 0:	#firetimeが0以下なら
		firetime = 50				#firetimeを50に戻す		
		var f = fire.instance()		#fireのインスタンスを作成(複製)
		f.start(position)			#fireの発生位置を敵の位置に設定
		get_parent().add_child(f)	#子として追加する
									#(インスタンスを作成しただけではシーンに追加されておらず表示されないためここで追加)
	firetime -= 1

#破壊されたときの処理
func hit():
	var b = bomb.instance()			#爆発インスタンスを作成
	b.start(position)				#爆発の初期値を敵の位置に設定
	get_parent().add_child(b)		#子に追加(インスタンスを作成しただけではシーンに追加されておらず表示されないためここで追加)
	queue_free()					#敵を削除
