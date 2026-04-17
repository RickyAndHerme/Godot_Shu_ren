extends CharacterBody2D

var ball = preload("res://Ball.tscn")

var vec := Vector2()
var speed := 300

#メインの処理	
func _physics_process(delta: float) -> void:
	#「&"left"」の「&」はStringName型を指定するときに使う。
	#引数にStringName型が指定できる箇所ではString型よりも文字列比較が高速に行える。
	vec = Input.get_vector(&"left", &"right", &"up", &"down")
	vec += vec * speed * delta
	move_and_collide(vec)
	
	if Global.score == 40:
		queue_free()
