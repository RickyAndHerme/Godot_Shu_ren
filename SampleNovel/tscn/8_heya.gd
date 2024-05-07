extends Node2D

func _ready() -> void:
	Global.save.start_label = "カップラーメン待ち"
	Global.save.text_name = "text02"

	%"1蓋を開けました".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.AKERU	#ゲームフラグ+16
		%"たぬきは……".visible = false
		Global.nve.text = ""
		Global.next_line()
	)

	%"2待機しました".connect(&"pressed", func() -> void:
		Global.save.gameflag += Global.flag.TAIKISURU	#ゲームフラグ+32
		%"たぬきは……".visible = false
		Global.nve.text = ""
		Global.nve.label_jump("光るカップラーメン")
	)

func _process(delta: float) -> void:
	match Global.label:
		"完成か未完成か":
			%"たぬきは……".visible = true
		"爆発カップラーメン":
			%AnimationPlayer.play("Dokan")
			var tw := create_tween()
			tw.tween_property(Global.nve, "position", Vector2(128, 280), 0)	#テキスト表示領域の位置を真ん中辺りにする
			tw.tween_callback(func() -> void: Global.next_line())
		"爆発エンド":
			Global.scene_move("res://tscn/GameOver.tscn")
		"光るカップラーメン":
			%AnimationPlayer.play("Hikari")
			Global.next_line()
		"空飛ぶカップラーメン":
			%AnimationPlayer.play("Madoware")
			Global.next_line()
		"逃げたカップラーメン":
			%AnimationPlayer.play("Nigerareta")
			Global.next_line()
		"がんばれたぬき":
			%AnimationPlayer.play("Makeruna")
			var tw = create_tween()
			tw.tween_property(Global.nve, "position", Vector2(128, 280), 0)	#テキスト表示領域の位置を真ん中辺りにする
			tw.tween_property(Global.nve,  "visible_ratio", 1, 1).from(0)
			tw.tween_callback(func() -> void: Global.next_line())
		"逃げられエンド":
			Global.scene_move("res://tscn/GameClear.tscn")

	Global.label = "" #分岐があるシーンではここでlabelを空にしておかないとバグるようだ。
