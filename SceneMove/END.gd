extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):	#ăăăȘă
		Global.scene_move("res://YamaKawa.tscn")
