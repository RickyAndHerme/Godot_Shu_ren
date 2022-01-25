extends Area2D

#Bombをpreloadする。preloadすると先にリソースを読み込んでおくためパフォーマンスが向上する。
#これに対するloadはloadがスクリプトで呼ばれたときに読み込みを開始する。
var bomb = preload("res://tscn/Bomb.tscn")

var vec = Vector2.ZERO	#ベクトル
var speed = 100			#弾の移動スピード

#初期化：狙い弾
func start(pos):
	#発射位置をposで指定
	position = pos	
	
	#「is_instance_valid」はそのノードが存在しているか否かを判定してくれる
	#プレイヤーノードが存在し、ライフが0でなければ、
	#プレイヤー座標 - 狙い弾座標をvecに代入する
	#プレイヤーが存在していなければ、ベクトルは下方向にする													
	if is_instance_valid(Global.jikinode) == true and Global.life != 0:
		vec = Global.jikinode.global_position - global_position
	else:
		vec = Vector2.DOWN
		
	#ベクトルの正規化
	vec = vec.normalized()
	#atan2で狙う方向を定める
	global_rotation = atan2(vec.y, vec.x)

#プロセス
func _process(delta):
	#弾の移動処理
	position += vec * speed * delta
	
	#範囲処理
	if position.x > 640 or position.x < 0 or position.y > 480 or position.x < 0:
		queue_free()

#弾が当たったときに呼び出す関数
#爆発エフェクトが発生し、弾を削除する
func hit():
	var b = bomb.instance()
	b.start(position)
	get_parent().add_child(b)
	queue_free()
