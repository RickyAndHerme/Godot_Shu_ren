extends Node2D

func _ready():
	Global.load_text("res://media/text01.txt")	#text01.txtの読み込み
	Global.lines = 0							#テキスト現在行を0で初期化
	Global.play_music()							#BGMを再生する
	
func _process(delta):
	if Global.lines == 3 and Input.is_action_just_pressed("click"):	#現在行が3であり、左クリックが入力されたら
		$TextWindow.visible = false									#TextWindowを非表示にする
		Global.scene_move("res://2gyunyu.tscn")						#次のシーンへ移動
