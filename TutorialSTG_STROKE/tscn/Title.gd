extends Node2D

#スペースキーが押された状態を記録する変数
var key = false

#プロセス
func _process(delta):
	#ハイスコア表示
	$hiscore.text = "HI-SCORE:" + str(Global.hiscore)
		
	#スペースキーが押され、keyがtrueでなければゲーム画面へ遷移
	#keyはスペースキーが連されても反応しないようにするために判定する
	if Input.is_action_just_pressed("ui_select") and key != true:
		key = true
		Transition.fade("res://tscn/Main.tscn")
		
