extends Node2D

func _ready():
	#1ietokawa.tscnはシナリオテキスト3行目で終了しているため一旦3で初期化しておく
	#毎回行数を記憶するやり方はあまり効率的ではないが現状はこうしておく。その内改修します。
	Global.lines = 3

func _process(delta):
	if Global.lines == 13 and Input.is_action_just_pressed("click"):	#現在行が13であり、左クリックが入力されたら
		$TextWindow.visible = false										#TextWindowを非表示にする
		Global.scene_move("res://Oshimai.tscn")							#次のシーンへ移動する
