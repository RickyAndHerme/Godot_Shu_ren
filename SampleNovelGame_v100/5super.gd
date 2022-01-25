extends Node2D

func _ready():
		$SoundNovelText.visible = true

func _process(delta):
	match Global.lines:
		#スーパーの中
		35:
			$pic/jiisan1.visible = true
			$SoundNovelText.textjump(36)
		#爺さん出現
		41:
			$pic/jiisan1.visible = false
		#レジへ移動
		45:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false	
				Global.scene_move("res://6reji.tscn")
