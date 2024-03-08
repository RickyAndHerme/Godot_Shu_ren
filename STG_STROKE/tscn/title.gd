extends AspectRatioContainer

#スペースキーが押された状態を記録する変数
var key := false

func _ready() -> void:
	#ハイスコア表示
	%Hiscore.text = "HI-SCORE:" + str(Global.hiscore)

func _unhandled_input(event: InputEvent) -> void:
	#スペースキーが押され、keyがtrueでなければゲーム画面へ遷移
	#keyはスペースキーが連打されても反応しないようにするために判定する
	var no := get_tree().current_scene.get_node("Target/Hiscore")
	if event.is_action_pressed(&"space") and key != true:
		key = true
		Transition.fade("res://tscn/Main.tscn")
