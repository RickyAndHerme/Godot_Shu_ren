extends CanvasLayer

func _ready() -> void:
	Global.nve.process_mode = Node.PROCESS_MODE_DISABLED

	#ゲーム開始時にセーブデータのスクリーンショットとタイムを読み込む
	for i in range(1, 3):	#注意！　この場合、範囲は「1～2」になる
		var f = FileAccess.open_encrypted_with_pass("user://savegame" + str(i) + ".data", FileAccess.READ, "kachikachi_angou")
		if f != null && f.file_exists("user://savegame" + str(i) + ".data"):
			Global.save = f.get_var()
			get_node("%SaveTime" + str(i)).text = Global.save.time
			get_node("%Save" + str(i) + "SS").set_texture(ImageTexture.create_from_image(Global.img[i - 1]))
			f.close()

	$"/root/Global/BGM_yoitenki".stop()		#BGMを停止する
	var tw = create_tween()
	tw.tween_callback(%AnimationPlayer.play.bind(&"move"))
	tw.tween_interval(4.0)
	tw.tween_property(%VBoxContainer, "visible", true, 0)

	#はじめるボタン
	%Start.connect(&"pressed", func() -> void:
		Global.load_text("res://media/text01.txt")	#text01.txtの読み込み
		Global.save.time = 0
		Global.label = ""
		Global.lines = 0
		Global.save.scn = ""
		Global.save.start_label = ""
		Global.save.gameflag = 0
		Global.nve.text = ""
		Global.nve.count= ""
		Global.scene_move("res://tscn/1_ietokawa.tscn")
	)

	#つづきからボタン
	%Continue.connect(&"pressed", func() -> void:
		%"ゲームデータ".visible = !%"ゲームデータ".visible
		%VBoxContainer.process_mode = Node.PROCESS_MODE_DISABLED if %"ゲームデータ".visible == true else Node.PROCESS_MODE_INHERIT
	)

	#おわるボタン
	%End.connect(&"pressed", func() -> void:
		get_tree().quit()
	)

	#ロード1
	%Load1Button.connect(&"pressed", _load.bind(1))
	
	#ロード2
	%Load2Button.connect(&"pressed", _load.bind(2))

	#ロードメニュー > 戻るボタン
	%ReturnButtom.connect("pressed", func() -> void:
		%"ゲームデータ".visible = !%"ゲームデータ".visible
		%VBoxContainer.process_mode = Node.PROCESS_MODE_DISABLED if %"ゲームデータ".visible == true else Node.PROCESS_MODE_INHERIT
	)

#ロード処理：numは識別番号
func _load(num: int) -> void:
	var file = FileAccess.open_encrypted_with_pass("user://savegame" + str(num) + ".data", FileAccess.READ, "kachikachi_angou")
	if file != null && file.file_exists("user://savegame" + str(num) + ".data"):
		Global.save = file.get_var()
		Global.nve.start()
		Global.scene_move("res://tscn/" + Global.save.tscn + ".tscn")
		Global.load_text("res://media/" + Global.save.text_name + ".txt")
		Global.backlog.text = ""
		Global.lines = Global.mes.find("/@" + Global.save.start_label) + 1
		if !$"/root/Global/BGM_yoitenki".playing: $"/root/Global/BGM_yoitenki".play()
		file.close()

