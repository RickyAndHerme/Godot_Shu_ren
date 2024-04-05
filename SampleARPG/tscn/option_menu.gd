extends CanvasLayer

func _ready():
	%Save.connect("pressed", _on_save_pressed)
	%DisplayMode.connect("pressed", _on_displaymode_pressed)
	%TitleBack.connect("pressed", _on_titleback_pressed)

#transtimeはトランジション中か否かを判定している。
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"escape") and !$"/root/Global/PlayerMenu".visible and get_tree().get_first_node_in_group(&"player") and $"/root/Transition/AnimationPlayer".current_animation == "":
		visible = !visible
		get_tree().paused = visible

#セーブは未実装
func _on_save_pressed() -> void:
	printt("まあだだよ")

#ウィンドウ/フルスクリーン切り替え
func _on_displaymode_pressed() -> void:
	$/root.mode = Window.MODE_FULLSCREEN if $/root.mode != Window.MODE_FULLSCREEN else Window.MODE_WINDOWED

#タイトルに戻る
func _on_titleback_pressed() -> void:
	visible = !visible
	get_tree().paused = visible
	$"/root/Global/PlayerState".visible = false
	Transition.fade("res://tscn/Title.tscn")
