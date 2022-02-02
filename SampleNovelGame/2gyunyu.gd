extends Node2D

func _process(delta):
	match Global.label:
		"text02へ進む":
			Global.scene_move("res://3dekake.tscn")	
			
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
