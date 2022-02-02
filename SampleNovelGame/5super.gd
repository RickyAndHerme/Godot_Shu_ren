extends Node2D

func _process(delta):
	match Global.label:
		"爺さん現る":
			$pic/jiisan1.visible = true
			Global.nextline()
		"去っていく爺さん":
			$pic/jiisan1.visible = false
			Global.nextline()
		"レジ":
			Global.scene_move("res://6reji.tscn")
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
