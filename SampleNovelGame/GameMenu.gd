extends CanvasLayer

var menuon = false

func _input(event):
	if Input.is_action_just_pressed("Rclick") and Global.curr_scn != null:	#右クリックされ且つcurr_scnがnullでなければ
		Global.curr_scn.paused = true
		if menuon == false:
			$ColorRect.visible = true
			menuon = true
		else:
			Global.curr_scn.paused = false
			$ColorRect.visible = false
			menuon = false 

#ゲーム終了ボタン
func _on_QuitButton_pressed():
	get_tree().quit()

#解像度変更ボタン
func _on_1280_720_pressed():
	OS.set_window_fullscreen(false)			#フルスクリーン状態を解除してから
	OS.set_window_size(Vector2(1280, 720))	#解像度を変更する

func _on_1600_900_pressed():
	OS.set_window_fullscreen(false)
	OS.set_window_size(Vector2(1600, 900))

func _on_1920_1080_pressed():
	OS.set_window_fullscreen(false)
	OS.set_window_size(Vector2(1920, 1080))

func _on_FullScreen_pressed():
	OS.set_window_fullscreen(true)
