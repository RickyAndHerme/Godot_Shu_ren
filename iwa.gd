extends KinematicBody2D

#_readyの前にayCast2Dノードを読み込む
onready var ray = $RayCast2D

#_physics_processでは岩が押されていなければcast_toのベクトルを常に(0,0)にする
func _physics_process(delta):
	ray.cast_to = Vector2.ZERO

#岩がプレイヤーに押された場合の移動処理
#moveメソッドの引数がプレイヤーの押している方向を受け取る
func move(dir):
	ray.cast_to = dir * 16		#目的地であるcast_toにプレイヤー方向＊16をする
	ray.force_raycast_update()	#レイキャストの情報を即座に更新する
	if !ray.is_colliding():		#レイキャストに物体が触れていなければ
		position += dir			#岩が押されている方向に動かす
		return true
	return false
