extends Node2D

#　特記事項　===================================================================
#キーを押すとフェードアウト/インしてMain.tscnに遷移する。
#必見のタイトル画像はマウスのフリーハンドで15分くらいで描いたものである。
#=============================================================================

func _input(event):
	if Input.is_action_pressed("ui_accept"):	#spaceキーが押されたなら
		Global.scene_move("res://Main.tscn")	#Mainシーンへ遷移
