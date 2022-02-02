extends Node2D

func _ready():
	if Global.gameflag >= 2:			#gameflagが2以上のときはバッドエンドに進む
		$SoundNovelText.labeljump("昼飯なしで帰宅")
		Global.nextline()
	else:
		$SoundNovelText.labeljump("昼飯ありで帰宅")
		Global.nextline()

func _process(delta):
	match Global.label:
		"手紙を拾う":
			$pic/kamikire.visible = true
			$pic/ouchi.visible = false
			Global.nextline()
		"恐怖の手紙1":
			$SoundNovelText.position.y = 240	#テキスト表示領域の位置を真ん中辺りにする
			$SoundNovelText.spflag = 0			#spflagを0にして通常のテキスト速度を無効にする
			$SoundNovelText.speed = 0.2			#文字の表示速度任意で変える
			Global.nextline()
		"恐怖の手紙2":
			$SoundNovelText.position.y = 0		#テキスト表示領域の位置を元に戻す
			$SoundNovelText.spflag = 1
			$SoundNovelText.speed = 0
			Global.nextline()
		"バッドエンド":
			Global.gameflag == 0
			Global.scene_move("res://Oshimai.tscn")
		"カップラーメン待ち":
			Global.scene_move("res://8heya.tscn")

	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
