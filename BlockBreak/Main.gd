extends Node2D
	
func _input(event):
	#ゲームオーバーかゲームクリアーの文字が表示されていれば
	if %GameOverCenterContainer.visible == true or %GameClearCenterContainer.visible == true:
		if Input.is_action_just_pressed("ui_select"):
			Global.score = 0
			Global.balls = 2
			get_tree().reload_current_scene()	#シーンの再読み込み
		
func _process(delta):
	#スコアが40になるとゲームクリアー
	if Global.score == 40:
		%GameClearCenterContainer.visible = true
	
	if Global.balls <= 0:
		%GameOverCenterContainer.visible = true

