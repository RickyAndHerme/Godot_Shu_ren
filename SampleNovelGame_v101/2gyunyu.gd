extends Node2D

func _process(delta):
	if Global.lines == 15 and Input.is_action_just_pressed("click"):	#現在行が13であり、左クリックが入力されたら
		$TextWindow.visible = false
		Global.scene_move("res://3dekake.tscn")
