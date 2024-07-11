extends CharacterBody2D

var vec := Vector2(1, 1)	#ボールのベクトル
var speed := 250			#ボールのスピード

func _physics_process(delta: float) -> void:
	#衝突情報をcolに代入(衝突情報には衝突したオブジェクト、残りの動き、衝突位置が含まれている)
	var col = move_and_collide(vec * speed * delta)
	
	#colに衝突情報がセットされているか？
	#衝突情報からから法線方向を取得し、その反射ベクトルを取得
	#衝突対象に"hit"メソッドが含まれていればヒット処理をする
	if col:
		vec = vec.bounce(col.get_normal())
		if col.get_collider().has_method("hit"):
			col.get_collider().hit()
	
	#画面下を抜けると死亡	
	if position.y > 740:
		Global.balls -= 1
		queue_free()
	
	#スコアが40になるとボールは消える
	if Global.score == 40:
		queue_free()
