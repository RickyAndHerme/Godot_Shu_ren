extends CanvasLayer

#LOGO.tscn → Title.tscn → 1ietokawa.tscn → 2gyunyu.tscn……の順にシーンは進行している

func _ready() -> void:
	%AnimationPlayer.play(&"scale")
	await get_tree().create_timer(1.0).timeout

func _input(event: InputEvent) -> void:
	#マウス左ボタンが押され、アニメーションが再生されていなければ
	if Input.is_action_just_pressed(&"LMB") && %AnimationPlayer.current_animation == "":
		Global.scene_move("res://tscn/Title.tscn")	#次のシーンに移動
