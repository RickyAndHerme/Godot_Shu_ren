extends KinematicBody2D

#変数
var vec2 = Vector2(1, 1)	#ボールのベクトル
var speed = 5				#ボールのスピード

#メイン処理
func _physics_process(delta):
	#衝突情報をcolに代入
	var col = move_and_collide(vec2 * speed)
	
	#衝突情報がセットされていれば
	if col:
		vec2 = vec2.bounce(col.normal)
		if col.collider.has_method("hit"):
			col.collider.hit()
	
	#画面下を抜けると死亡	
	if position.y > 740:
		Global.balls -= 1
		queue_free()
	
	#スコアが40になるとボールは消える
	if Global.score == 40:
		queue_free()
