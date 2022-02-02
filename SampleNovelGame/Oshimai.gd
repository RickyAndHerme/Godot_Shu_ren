extends Node2D

onready var backlog = get_node("/root/GameMenu/ColorRect/TabContainer/バックログ/BackLog")	#バックログノードを取得

func _ready():
	Global.curr_scn = null	#_ready()の中でこの一行を加えるとそのシーンでは右クリックメニューを呼び出さないようにできる

func _process(delta):
	if Input.is_action_just_pressed("Lclick"):	#左クリックが入力されたら
		backlog.clear()							#バックログクリアー
		Global.scene_move("res://Title.tscn")	#タイトルへ移動する
