extends Node2D

func _process(delta):
	match Global.label:
		"背後の爺さん":
			$pic/reji_jiisan.visible = true
			Global.nextline()
		"列から外れるか否か":
			$"そこでたぬきは……" .rect_position.y = 80 + ($SoundNovelText/Text.get_visible_line_count()+1 * 50)
			$"そこでたぬきは……".visible = true
		"爺さんに見つかった":
			$pic/tanuki_behind_jiisan.visible = true
			Global.nextline()
		"ジャンプ：昼飯なしで帰宅":
			$SoundNovelText.labeljump("昼飯なしで帰宅")
		"アライメント調整":
			$pic/reji_tanuki.visible = false
			Global.nextline()
		"昼飯なしで帰宅":
			Global.scene_move("res://7ieji.tscn")
		"昼飯ありで帰宅":
			Global.scene_move("res://7ieji.tscn")
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく




#列から外れるか否か：1列からこっそり外れました。
func _on_1_pressed():
	Global.gameflag += 2				#ゲームフラグ+2
	$"そこでたぬきは……".visible = false
	$pic/reji_tanuki.visible = false
	Global.nextline()

#列から外れるか否か：2そのまま列に並ぶことにしました。
func _on_2_pressed():
	$"そこでたぬきは……".visible = false
	$SoundNovelText.labeljump("アライメント調整")
