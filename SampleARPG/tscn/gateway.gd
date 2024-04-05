extends Area2D

#インスペクタ上で編集
@export var path: String		#シーンのパス
@export var warp_point: Vector2	#プレイヤー遷移先の座標

func _ready() -> void:
	body_entered.connect(_on_body_entered)

#エリアに触れると遷移先の座標を一時的にGlobal.player_posに保存しシーンを切り替える
func _on_body_entered(body: Node2D) -> void:
	Global.player_pos = warp_point
	Transition.mosaic_transition(path)
