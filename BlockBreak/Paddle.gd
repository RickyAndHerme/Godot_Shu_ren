extends CharacterBody2D

var ball = preload("res://Ball.tscn")

var vec2 = Vector2()
var speed = 10


#移動処理
func _input(event):
	vec2 = Vector2()					#ここで一度Vector2を初期化しないと前回の移動処理が継続して行われてしまう。
	if Input.is_action_pressed("ui_left"):
		vec2 = Vector2(-speed, 0)
	if Input.is_action_pressed("ui_right"):
		vec2 = Vector2(speed, 0)

#メインの処理	
func _physics_process(delta):
	move_and_collide(vec2)
	
	if Global.score == 40:
		queue_free()
