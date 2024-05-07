extends Node2D

func _ready() -> void:
	#gameflag値による分岐
	Global.save.text_name = "text02"
	match Global.save.gameflag:
		5, 6:
			Global.save.start_label = "昼飯なしで帰宅"
			Global.nve.label_jump("昼飯なしで帰宅")
			Global.next_line()
		9:
			Global.save.start_label = "うさぎ遭遇で昼飯ありで帰宅"
			Global.nve.label_jump("うさぎ遭遇で昼飯ありで帰宅")
			Global.next_line()
		10:
			Global.save.start_label = "昼飯ありで帰宅"
			Global.nve.label_jump("昼飯ありで帰宅")
			Global.next_line()

func _process(delta: float) -> void:
	match Global.label:
		"うさぎ遭遇で昼飯ありで帰宅":
			Global.next_line()
		"手紙を拾う":
			%kamikire.visible = true
			%ouchi.visible = false
			Global.next_line()
		"恐怖の手紙1":
			var tw := create_tween()
			tw.tween_property(Global.nve, "position", Vector2(128, 280), 0)	#テキスト表示領域の位置を真ん中辺りにする
			tw.tween_property(Global.nve, "visible_ratio", 1, 1).from(0)
			tw.tween_callback(func() -> void: Global.next_line())
		"恐怖の手紙2":
			var tw := create_tween()
			tw.tween_property(Global.nve, "position", Vector2(128, 72), 0)
			tw.tween_callback(func() -> void: Global.next_line())
		"手紙エンド":
			Global.scene_move("res://tscn/GameOver.tscn")
		"カップラーメン待ち":
			Global.scene_move("res://tscn/8_heya.tscn")

	Global.label = "" #分岐があるシーンではここでlabelを空にしておかないとバグるようだ。
