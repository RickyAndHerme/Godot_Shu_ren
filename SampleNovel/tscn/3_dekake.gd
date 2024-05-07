extends Node2D

#画像全体の明度を調整するためシーンにあるpicノードに画像は全て入れている。

func _ready() -> void:
	Global.save.start_label = "山道"
	Global.save.text_name = "text02"


	#選択肢は予め「GridContainer」の子に「Button」を作成して用意しておいた。
	#pressedシグナルの中身をラムダ関数で記述している。

	%"1茂みにかくれました。".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.KAKURERU	#ゲームフラグ+2
		%"そして……".visible = false						#選択肢ボタン非表示
		%tanuki1.visible = false						#たぬき消去
		Global.nve.text = ""
		Global.next_line()
	)

	%"2足が震えて動けませんでした。".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.UGOKENAI	#ゲームフラグ+1
		%"そして……".visible = false						#選択肢ボタン非表示
		Global.nve.text = ""
		Global.nve.label_jump("足が震えて")				#シナリオジャンプ
	)
	
func _process(delta: float) -> void:
	#指定されたラベル名の箇所で演出を行える。通常のGDScriptを書く要領で問題ない。
	match Global.label:
		"山道":
			Global.next_line()
		"うさぎ出現":
			%usagi1.visible = true
			Global.next_line()			#次のシナリオ行へ移動する
		"隠れるか否か":
			%"そして……".visible = true	#選択肢表示
		"うさぎ接近1":
			%usagi1.position = Vector2(810, 422)
			%usagi1.scale = Vector2(0.8, 0.8)
			Global.next_line()
		"通り過ぎるうさぎ":
			%usagi1.visible = false	
			Global.next_line()
		"足が震えて":
			Global.next_line()
		"うさぎ接近2":
			%usagi1.position = Vector2(810, 422)
			%usagi1.scale = Vector2(0.8, 0.8)
			Global.next_line()
		"通り過ぎるうさぎ":
			%usagi1.visible = false
			Global.next_line()
		"胸をなでおろすたぬき":
			%tanuki1.visible = true
			Global.next_line()
		"商店街入り口":
			Global.scene_move("res://tscn/4_syoutengai.tscn")	#次のシーンへ移動する

	Global.label = "" #分岐があるシーンではここでlabelを空にしておかないとバグるようだ。
