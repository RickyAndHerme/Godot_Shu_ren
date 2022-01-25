extends Node2D

#3dekake.tscnからは画面全体にテキストを表示する形式で進行する。
#シーンにあるpicノードに画像は全て入れておく。画像全体の明度を調整している。

func _ready():
	Global.load_text("res://media/text02.txt")	#text02.txtを読み込み
	Global.lines = 0							#テキスト現在行を0で初期化

func _process(delta):
	#tscnファイルごとに行数指定すればその箇所で演出を行える。
	#自由に処理を書けるがシナリオ行数で指定するためシナリオ修正などで行数が変動すると指定行の変更も必要となり使い勝手が悪い。なんとかしたい。
	
	#＞！＜自分オリジナルのシナリオで進行が途中で止まる場合は大抵指定行が間違っていることが多い。一度シナリオと照らし合わせてみよう。
	match Global.lines:
		#うさぎ出現
		3:
			$pic/usagi1.visible = true
		#選択肢：そして……
		7:
			$"そして……".rect_position.y = 80 + ($SoundNovelText/Text.get_visible_line_count()+1 * 50)	#選択肢表示位置を指定
			$"そして……".visible = true	#選択肢表示
		#うさぎが接近
		9:
			$pic/usagi1.position = Vector2(810, 422)
			$pic/usagi1.scale = Vector2(0.8, 0.8)
		#うさぎが通り過ぎる、「ほっ……」@+　
		12:
			$pic/usagi1.visible = false
			$SoundNovelText.textjump(21)	#ジャンプ：21行目に飛ぶ
		#うさぎが接近
		15:
			$pic/usagi1.position = Vector2(810, 422)
			$pic/usagi1.scale = Vector2(0.8, 0.8)
		#うさぎが通り過ぎる
		19:
			$pic/usagi1.visible = false
			
		#たぬきが姿を現す
		21:
			$pic/tanuki1.visible = true
		#4syoutengai.tscnへ移動
		26:
			if $SoundNovelText.visible == true:				#テキストウィンドウが表示中ならば
				$SoundNovelText.visible = false				#テキストウィンドウを非表示にする(こうすると26行目の演出は1回しか実行されない)
				Global.scene_move("res://4syoutengai.tscn")	#次のシーンへ移動する

#=================================================================================================
#選択肢ボタン
#＊選択肢はtscnファイルごとに必要な選択肢を予め「GridContainer」に選択肢用「Button」を格納して非表示にして用意しておく。
#選択肢用「Button」のpressedノードをこのスクリプトに接続しボタンの処理を記述していく。
#=================================================================================================
#シナリオ7行目：1.茂みに隠れました
func _on_1_pressed():
	$"そして……".visible = false	#選択肢ボタン非表示
	$SoundNovelText.textjump(8)	#シナリオジャンプ
	$pic/tanuki1.visible = false#たぬき消去

#シナリオ7行目：2.足が震えて動けませんでした。
func _on_2_pressed():
	Global.gameflag += 1		#ゲームフラグ+1
	$"そして……".visible = false	#選択肢ボタン非表示
	$SoundNovelText.textjump(13)#シナリオジャンプ
