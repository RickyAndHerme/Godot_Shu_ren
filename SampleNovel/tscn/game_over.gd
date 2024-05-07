extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(&"LMB") && $"/root/Global/AnimationPlayer".current_animation == "":
		Global.label == ""
		Global.lines = 0
		Global.save.start_label = ""
		Global.save.tscn == ""
		Global.save.gameflag == 0
		Global.backlog.text = ""							#バックログクリア
		Global.nve.start()
		Global.scene_move("res://tscn/Title.tscn")	#タイトルへ移動する
