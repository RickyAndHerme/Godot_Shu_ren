extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("click"):	#左クリックが入力されたら
		Global.scene_move("res://Title.tscn")	#タイトルへ移動する
