extends Node2D

func _process(delta):
	match Global.label:
		"スーパーマーケット入店":
			Global.scene_move("res://5super.tscn")
	
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
