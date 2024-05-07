extends Node2D

func _ready() -> void:
	Global.save.start_label = "商店街入り口"
	Global.save.text_name = "text02"

func _process(delta: float) -> void:
	match Global.label:
		"スーパーマーケット入店":
			Global.scene_move("res://tscn/5_super.tscn")
