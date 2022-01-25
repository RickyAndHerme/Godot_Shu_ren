extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):	#spaceまたはenterが一度押されたら
		Global.scene_move("res://Taiheiyou.tscn")	#指定したシーンに移動する
