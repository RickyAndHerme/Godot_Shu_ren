extends Node2D

func _process(delta):
	match Global.label:
		"夕暮れ時":
			$pic/ienonaka6ji.visible = true
			$pic/ienonaka4ji.visible = false
			Global.nextline()
		"おいしそうならーめん":
			$SoundNovelText.position.y = 240	#テキスト表示領域の位置を真ん中辺りにする
			$SoundNovelText.spflag = 0			#spflagを0にして通常のテキスト速度を無効にする
			$SoundNovelText.speed = 0.2			#文字の表示速度任意で変える
			Global.nextline()
			
		"グッドエンディング":
			$SoundNovelText.position.y = 0
			$SoundNovelText.spflag = 1
			$SoundNovelText.speed = 0	
			Global.gameflag == 0
			Global.scene_move("res://GameClear.tscn")
				
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
