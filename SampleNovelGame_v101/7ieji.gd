extends Node2D

func _ready():
	if Global.gameflag >= 2:			#gameflagが2以上のときはバッドエンドに進む
		$SoundNovelText.textjump(78)
	else:
		$SoundNovelText.textjump(93)
	$SoundNovelText.visible = true

func _process(delta):
	match Global.lines:
		#「こんや　ばんごはん　たぬきの　とんこつしょうゆ　なべ」の箇所
		#シナリオ上では88、90行目に演出モードの指定がある。演出モードをONにしなくても実現できるが、
		#ボタン入力などが反応し演出の下準備が少し見えてしまうため演出モードをONにしている。
		85:
			$pic/kamikire.visible = true
			$pic/ouchi.visible = false
			$SoundNovelText.textjump(86)
		#テキスト位置を中央にする演出
		88:
			$SoundNovelText.position.y = 240	#テキスト表示領域の位置を真ん中辺りにする
			$SoundNovelText.speed = 0.2			#文字の表示速度を変える
			$SoundNovelText.textjump(89)
		#テキスト表示を元に戻す演出
		90:
			$SoundNovelText.position.y = 0		#テキスト表示領域の位置を元に戻す
			$SoundNovelText.speed = 1.0			#文字の表示速度をもとに戻す
			$SoundNovelText.textjump(91)
		#バッドエンド
		92:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false
				Global.gameflag == 0
				Global.scene_move("res://Oshimai.tscn")
		#部屋の中に移動
		98:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false
				Global.scene_move("res://8heya.tscn")
