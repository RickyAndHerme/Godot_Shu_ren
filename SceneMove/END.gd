extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):	#おんなじ
		Global.scene_move("res://YamaKawa.tscn")
