extends CanvasLayer

func _ready() -> void:
	Global.gamemenu.visible = false
	
	#ゲーム開始時にセーブデータのスクリーンショットとタイムを読み込む
	for i in range(1, 3):	#注意！　この場合範囲は「1～2」になる
		var f = FileAccess.open_encrypted_with_pass("user://savegame" + str(i) + ".data", FileAccess.READ, "kachikachi_angou")
		if f != null && f.file_exists("user://savegame" + str(i) + ".data"):
			Global.save = f.get_var()
			get_node("%SaveTime" + str(i)).text = Global.save.time
			get_node("%Save" + str(i) + "SS").set_texture(ImageTexture.create_from_image(Global.img[i - 1]))
			f.close()

#ラムダ関数でシグナルメソッドを記述。ノード名が数字から始まる場合は""で囲まないとエラーになる。
	
	#解像度変更
	%"1280_720".connect(&"pressed", func() -> void:
		$/root.mode = Window.MODE_WINDOWED	#フルスクリーン状態を解除してから
		$/root.size = Vector2i(1280, 720)	#解像度を変更する
	)

	%"1600_900".connect(&"pressed", func() -> void:
		$/root.mode = Window.MODE_WINDOWED
		$/root.size = Vector2i(1600, 900)	
	)
		
	%"1920_1080".connect(&"pressed", func() -> void:
		$/root.mode = Window.MODE_WINDOWED
		$/root.size = Vector2i(1920, 1080)
	)

	%FullScreen.connect(&"pressed", func() -> void:
		#フルスクリーンならウィンドウに切り替え、ウィンドウならフルスクリーンに切り替える
		$/root.mode = Window.MODE_EXCLUSIVE_FULLSCREEN if $/root.mode != Window.MODE_EXCLUSIVE_FULLSCREEN else Window.MODE_WINDOWED
	)

	#タイトルに戻る
	%TitleButton.connect(&"pressed", func() -> void:
		Global.save.time = 0
		Global.label = ""
		Global.lines = 0
		Global.save.scn = ""
		Global.save.start_label = ""
		Global.save.gameflag = 0
		Global.nve.text = ""
		Global.nve.count= ""
		Global.nve.process_mode = Node.PROCESS_MODE_DISABLED
		Global.scene_move("res://tscn/Title.tscn")
	)

	#セーブ1：
	%Save1Button.connect(&"pressed", _save.bind(1))

	#セーブ2
	%Save2Button.connect(&"pressed", _save.bind(2))

	#ロード1
	%Load1Button.connect(&"pressed", _load.bind(1))

	#ロード2
	%Load2Button.connect(&"pressed", _load.bind(2))

#セーブ処理：numは識別番号
func _save(num: int) -> void:
	var file = FileAccess.open_encrypted_with_pass("user://savegame" + str(num) + ".data", FileAccess.WRITE, "kachikachi_angou")	#暗号化して書き込み。
	if file.file_exists("user://savegame" + str(num) + ".data"):
		Global.save.time = Time.get_datetime_string_from_system()	#現在時刻を取得
		Global.save.tscn = get_tree().current_scene.name			#現在表示されているシーンの名前を取得
		visible = !visible											#スクリーンショットを撮るときに邪魔になるのでゲームメニューを一旦非表示にしておく
		await RenderingServer.frame_post_draw								#ビューポートの更新がすべて完了するまで待機する
		Global.img[num - 1] = get_viewport().get_texture().get_image()		#上記はビューポート更新が完了しないとここで取得するスクリーンショットが真っ黒になることがある
		Global.img[num - 1].save_png("user://save_ss" + str(num) + ".png")	#スクリーンショットのサムネイルを作成しユーザーフォルダに保存する
		visible = !visible
		file.store_var(Global.save)		#セーブするデータを書き込む

		#セーブ後
		get_node("%SaveTime" + str(num)).text = Global.save.time		#セーブ時の時間を表示する
		get_node("%Save" + str(num) + "SS").set_texture(ImageTexture.create_from_image(Global.img[num - 1]))	#スクリーンショットを元にImageTextureを作成して設定
		file.close()

#ロード処理：numは識別番号
func _load(num: int) -> void:
	var file = FileAccess.open_encrypted_with_pass("user://savegame" + str(num) + ".data", FileAccess.READ, "kachikachi_angou")
	if file != null && file.file_exists("user://savegame" + str(num) + ".data"):
		Global.save = file.get_var()										#セーブファイルを読み込む
		Global.nve.start()													#テキスト周りのcountやlabelなどを初期化する
		Global.scene_move("res://tscn/" + Global.save.tscn + ".tscn")		#セーブしたときのシーンに移動する
		Global.load_text("res://media/" + Global.save.text_name + ".txt")	#セーブしたシーンに対応したシナリオファイルを読み込む
		Global.backlog.text = ""											#バックログをクリアする
		Global.lines = Global.mes.find("/@" + Global.save.start_label) + 1	#セーブしたシーンのラベルを検索しその行のテキストを読み込む
		if !$"/root/Global/BGM_yoitenki".playing: $"/root/Global/BGM_yoitenki".play()
		file.close()

func _input(event: InputEvent) -> void:
	#右クリックされ、現在シーンの親がCanvasLayer型でなく、シーン遷移アニメーションが再生中でなければ、
	#visibleを反転させた結果をvisibleに代入し、ポーズモード状態をvisibleのture/falseで制御している
	if event.is_action_pressed(&"RMB") && !get_tree().current_scene is CanvasLayer && $"/root/Global/AnimationPlayer".current_animation == "":
		Global.nve.visible = !Global.nve.visible
		Global.gamemenu.visible = !Global.gamemenu.visible
		Global.nve.process_mode = Node.PROCESS_MODE_DISABLED if Global.nve.visible == false else Node.PROCESS_MODE_INHERIT
