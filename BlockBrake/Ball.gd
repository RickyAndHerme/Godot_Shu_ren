extends CharacterBody2D

#変数
var vec2 := Vector2(1, 1)	#ボールのベクトル
var speed := 5				#ボールのスピード

func _physics_process(delta: float) -> void:
	#衝突情報をcolに代入
	var col := move_and_collide(vec2 * speed)
	
	#衝突情報がセットされていれば、コライダーの法線を取得しその反射方向のベクトルをボールのベクトルに代入
	#衝突したコライダーが"hit"メソッドを所持していればhitの処理を呼び出す
	if col:
		vec2 = vec2.bounce(col.get_normal())
		if col.get_collider().has_method("hit"):
			col.get_collider().hit()
	
	#画面下を抜けると死亡
	if position.y > 740:
		Global.balls -= 1
		queue_free()
	
	#スコアが40になるとボールは消える
	if Global.score == 40:
		queue_free()
