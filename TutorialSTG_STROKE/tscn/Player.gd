extends Area2D

#Shot1、Bombをpreloadする。preloadすると先にリソースを読み込んでおくためパフォーマンスが向上する。
#これに対するloadはloadがスクリプトで呼ばれたときに読み込みを開始する
var shot = preload("res://tscn/Shot.tscn")
var bomb = preload("res://tscn/Bomb.tscn")


var vec = Vector2.ZERO	#ベクトル
var rolltime = 20		#プレイヤー機の左右の傾きアニメーションの時間
var shottime = 8		#弾の発射間隔
var speed = 250			#プレイヤーの移動速度

#プロセス
func _process(delta):
	vec = Vector2.ZERO						#ベクトル0にする
	
	#プレイヤーの移動処理
	if Input.is_action_pressed("ui_up"):
		vec += Vector2.UP
	
	if Input.is_action_pressed("ui_down"):
		vec += Vector2.DOWN
		
	if Input.is_action_pressed("ui_left"):
		vec += Vector2.LEFT
		if rolltime >= 0:	#rolltimeが0以上ならば、rolltimeを-1する
			rolltime -= 1
	elif !Input.is_action_pressed("ui_left") and rolltime <= 20:	#左が押されて、rolltimeが20以下ならば
		rolltime += 1	#rolltimeを+1する
		
	if Input.is_action_pressed("ui_right"):
		vec += Vector2.RIGHT
		if rolltime <= 40:	#rolltimeが40以下ならば、rolltimeを+1する
			rolltime += 1
	elif !Input.is_action_pressed("ui_right") and rolltime >= 29:	#右が押されて、rolltimeが29以上ならば
		rolltime -= 1		#rolltimeを-1する
	
	#スペースキーが押され、shottimeが0未満なら弾を発射
	#ショットは並列して2発動時に発射するためs1、s2それぞれ初期位置を変えている
	if Input.is_action_pressed("ui_select") and shottime < 0:
		shottime = 8
		var s1 = shot.instance()
		var s2 = shot.instance()
		s1.start(position.x -10, position.y)
		s2.start(position.x +10, position.y)
		get_parent().add_child(s1)
		get_parent().add_child(s2)
	
	position += vec * speed * delta					#ベクトルにspeedとdeltaをかけている
	position.x = clamp(position.x, 0+15, 640-15)	#x方向の移動範囲処理
	position.y = clamp(position.y, 0+15, 480-15)	#y方向の移動範囲処理
	
	#rolltimeを10で割ることでプロパティのframe値を割り出している
	$Sprite.frame = rolltime/10
	
	shottime -= 1

#プレイヤーの当たり判定処理
func _on_Player_area_entered(area):
	#プレイヤーに当たったものがenemyグループだった場合、爆発エフェクトを作りライフを-1してプレイヤー削除
	if area.is_in_group("enemy"):
		var b = bomb.instance()
		b.start(position)
		get_parent().add_child(b)
		Global.life -= 1
		queue_free()
	
	#同じようにenemyshotグループだった場合、敵のhit関数を呼び出し、ライフを-1してプレイヤー削除
	elif area.is_in_group("enemyshot"):
		Global.life -= 1
		area.hit()
		queue_free()
