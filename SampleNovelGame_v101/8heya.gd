extends Node2D

func _ready():
	$SoundNovelText.visible = true

func _process(delta):
	match Global.lines:
		#日暮れ時
		104:
			$pic/ienonaka6ji.visible = true
			$pic/ienonaka4ji.visible = false
		#テキスト位置の演出
		108:
			$SoundNovelText.position.y = 240	#テキスト表示領域の位置を真ん中辺りにする
			$SoundNovelText.speed = 0.2			#文字の表示速度を変える
			$SoundNovelText.textjump(109)
			
		#グッドエンディング
		110:
			if $SoundNovelText.visible == true:
				$SoundNovelText.position.y = 0
				$SoundNovelText.speed = 1.0	
				$SoundNovelText.visible = false
				Global.gameflag == 0
				Global.scene_move("res://GameClear.tscn")
