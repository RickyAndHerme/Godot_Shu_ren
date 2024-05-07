extends Node2D

func _ready() -> void:
	Global.save.start_label = "レジ"
	Global.save.text_name = "text02"

	#選択肢は予め「VBoxContainer」の子に「Button」を作成して用意しておいた。
	#pressedシグナルの中身をラムダ関数で記述している。

	%"1列からこっそり外れました。".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.HAZURERU	#ゲームフラグ+4
		%"そこでたぬきは……".visible = false
		%reji_tanuki.visible = false
		Global.nve.text = ""
		Global.next_line()
	)

	%"2そのまま列に並ぶことにしました。".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.SONOMAMA	#ゲームフラグ+8
		%"そこでたぬきは……".visible = false
		Global.nve.text = ""
		Global.nve.label_jump("アライメント調整")
	)

func _process(delta: float) -> void:
	match Global.label:
		"背後の爺さん":
			%reji_jiisan.visible = true
			Global.next_line()
		"列から外れるか否か":
			%"そこでたぬきは……".visible = true
		"爺さんに見つかった":
			%tanuki_behind_jiisan.visible = true
			Global.next_line()
		"アライメント調整":
			%reji_tanuki.visible = false
			Global.next_line()
		"昼飯なしで帰宅":
			Global.scene_move("res://tscn/7_ieji.tscn")
		"うさぎ遭遇で昼飯ありで帰宅":
			Global.scene_move("res://tscn/7_ieji.tscn")
		"昼飯ありで帰宅":
			Global.scene_move("res://tscn/7_eji.tscn")

	Global.label = "" #分岐があるシーンではここでlabelを空にしておかないとバグるようだ。
