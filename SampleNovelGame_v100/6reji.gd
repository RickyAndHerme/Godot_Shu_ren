extends Node2D

func _ready():
		$SoundNovelText.visible = true

func _process(delta):
	match Global.lines:
		#レジの後ろに爺さんが立つ
		52:
			$pic/reji_jiisan.visible = true
			$SoundNovelText.textjump(53)
		#選択肢
		57:
			$"そこでたぬきは……" .rect_position.y = 80 + ($SoundNovelText/Text.get_visible_line_count()+1 * 50)
			$"そこでたぬきは……".visible = true
		#たぬきの後ろに爺さんが立つ
		66:
			$pic/tanuki_behind_jiisan.visible = true
		#バッドエンドの家路シナリオへ
		73:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false	
				Global.scene_move("res://7ieji.tscn")
		#グッドエンドの家路シナリオへ
		77:
			if $SoundNovelText.visible == true:
				$SoundNovelText.visible = false
				Global.scene_move("res://7ieji.tscn")




#シナリオ56行目：1列からこっそり外れました。
func _on_1_pressed():
	Global.gameflag += 2				#ゲームフラグ+2
	$"そこでたぬきは……".visible = false
	$SoundNovelText.textjump(58)
	$pic/reji_tanuki.visible = false		#たぬき消去
	$pic/reji_jiisan.visible = false		#爺さん消去

#シナリオ56行目：2そのまま列に並ぶことにしました。
func _on_2_pressed():
	$"そこでたぬきは……".visible = false
	$SoundNovelText.textjump(74)
	$pic/reji_tanuki.visible = false		#たぬき消去
