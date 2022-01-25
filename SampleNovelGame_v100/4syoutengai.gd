extends Node2D

func _ready():
	$SoundNovelText.visible = true

func _process(delta):
	match Global.lines:
		#商店街
		32:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false
				Global.scene_move("res://5super.tscn")




