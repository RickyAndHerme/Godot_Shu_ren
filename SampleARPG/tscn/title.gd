extends Node2D

#スペースキーを押すとモザイクトランジションでシーン遷移する
#Global.player_posにFieldAreaシーンのプレイヤー初期位置を代入している
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"space"):
		Global.player_state.hp = 3
		Transition.fade("res://tscn/FieldArea.tscn")
		for node in get_tree().get_nodes_in_group("mylife"):
			node.visible = true
		Global.player_pos = Vector2(240, 240)
