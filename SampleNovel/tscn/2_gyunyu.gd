extends Node2D

func _ready() -> void:
	Global.save.start_label = "アスピリン"
	Global.save.text_name = "text01"

func _process(delta: float) -> void:
	match Global.label:
		"text02へ進む":
			Global.load_text("res://media/text02.txt")		#text02.txtの読み込み
			Global.scene_move("res://tscn/3_dekake.tscn")
