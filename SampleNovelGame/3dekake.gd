extends Node2D

#画像全体の明度を調整するためシーンにあるpicノードに画像は全て入れている。

func _ready():
	Global.load_text("res://media/text02.txt")	#text02.txtを読み込み
	Global.lines = 0							#テキスト現在行を0で初期化

func _process(delta):
	#指定されたラベル名の箇所で演出を行える。通常のGDScriptを書く要領で問題ない。
	match Global.label:
		"うさぎ出現":
			$pic/usagi1.visible = true
			Global.nextline()			#次のシナリオ行へ移動する
		"隠れるか否か":
			$"そして……".rect_position.y = 80 + ($SoundNovelText/Text.get_visible_line_count()+1 * 50)	#選択肢表示位置を指定
			$"そして……".visible = true	#選択肢表示
		"うさぎ接近1":
			$pic/usagi1.position = Vector2(810, 422)
			$pic/usagi1.scale = Vector2(0.8, 0.8)
			Global.nextline()
		"通り過ぎるうさぎ":
			$pic/usagi1.visible = false	
			Global.nextline()
		"ジャンプ：胸をなでおろす":
			$SoundNovelText.labeljump("胸をなでおろすたぬき")	#ラベルジャンプ
		"足が震えて":
			Global.nextline()
		"うさぎ接近2":
			$pic/usagi1.position = Vector2(810, 422)
			$pic/usagi1.scale = Vector2(0.8, 0.8)
			Global.nextline()
		"通り過ぎるうさぎ":
			$pic/usagi1.visible = false
			Global.nextline()
		"胸をなでおろすたぬき":
			$pic/tanuki1.visible = true
			Global.nextline()
		"商店街入り口":
			Global.scene_move("res://4syoutengai.tscn")	#次のシーンへ移動する
	
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
			

#=================================================================================================
#選択肢ボタン
#選択肢はtscnファイルごとに必要な選択肢を予め「GridContainer」に選択肢用「Button」を格納して非表示にして用意しておいた。
#選択肢用「Button」のpressedノードをこのスクリプトに接続しボタンの処理を記述していく。
#=================================================================================================
#隠れるか否か：1.茂みに隠れました
func _on_1_pressed():
	$"そして……".visible = false		#選択肢ボタン非表示
	$pic/tanuki1.visible = false	#たぬき消去
	$SoundNovelText/Text.text = ""
	Global.nextline()

#隠れるか否か：2.足が震えて動けませんでした。
func _on_2_pressed():
	Global.gameflag += 1					#ゲームフラグ+1
	$"そして……".visible = false				#選択肢ボタン非表示
	$SoundNovelText/Text.text = ""
	$SoundNovelText.labeljump("足が震えて")	#シナリオジャンプ
