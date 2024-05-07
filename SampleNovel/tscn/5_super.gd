extends Node2D

func _ready() -> void:
	Global.save.start_label = "スーパーマーケット入店"
	Global.save.text_name = "text02"

func _process(delta: float) -> void:
	match Global.label:
		"爺さん現る":
			%jiisan1.visible = true
			Global.next_line()
		"去っていく爺さん":
			%jiisan1.visible = false
			Global.next_line()
		"レジ":
			Global.scene_move("res://tscn/6_reji.tscn")
