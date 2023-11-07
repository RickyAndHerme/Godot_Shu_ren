extends Node2D
	
func _input(event: InputEvent) -> void:
	#ゲームオーバーかゲームクリアーの文字が表示されていれば
	if %GameOverCenterContainer.visible == true or %GameClearCenterContainer.visible == true:
		if event.is_action_pressed("space"):
			Global.score = 0
			Global.balls = 2
			get_tree().reload_current_scene()	#シーンの再読み込み
		
func _process(delta: float) -> void:
	#スコアが40になるとゲームクリアー
	if Global.score == 40:
		%GameClearCenterContainer.visible = true
	
	if Global.balls <= 0:
		%GameOverCenterContainer.visible = true

