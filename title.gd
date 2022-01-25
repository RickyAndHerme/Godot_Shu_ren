extends Node2D

#スペースキーを押すとモザイクトランジションでシーン遷移する
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Transition.mosaic_transition("res://FieldArea.tscn")
