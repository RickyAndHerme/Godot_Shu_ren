extends CharacterBody2D

const ball := preload("res://Ball.tscn")

var vec := Vector2()
var speed := 300


#メインの処理	
func _physics_process(delta: float) -> void:
	#get_axisで左右の軸入力を取得vec.xに代入。上下の移動は行わないのでxのみ。	
	vec.x = Input.get_axis("left", "right")
	vec.x += vec.x * speed * delta
	move_and_collide(vec)
	
	if Global.score == 40:
		queue_free()
