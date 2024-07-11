extends CanvasLayer

#プレイヤーの初期化処理
func player_init() -> void:
	%Lv.text = str(Global.player_state.lv)
	%Hp.text = str(Global.player_state.hp)
	%Mp.text = str(Global.player_state.mp)
	%Pow.text = str(Global.player_state.power)
	%Def.text = str(Global.player_state.defense)
	%For.text = str(Global.player_state.fortune)
	%Exp.text = str(Global.player_state.exp)
	%Gol.text = str(Global.player_state.gold)

func _ready() -> void:
	player_init()

#OptionMenuが非表示であり、プレイヤーが存在し、Transitionアニメーションが再生中ではなく「tabキー」が押されたらプレイヤーメニューを開く。
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"tab") and !$"/root/Global/OptionMenu".visible and get_tree().get_first_node_in_group(&"player") and $"/root/Transition/AnimationPlayer".current_animation == "":
		visible = !visible
		get_tree().paused = visible

func _process(delta: float) -> void:
	player_init()	#フレームごとにプレイヤーのステータスを更新しているが改良の余地あり
 
