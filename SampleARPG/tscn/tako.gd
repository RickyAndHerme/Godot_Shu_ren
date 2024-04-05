extends CharacterBody2D

var lv := 1			#レベル
var hp := 3			#体力
var mp := 0			#魔法
var power := 1		#力
var defense := 1	#守り
var	exp := 1		#獲得経験値
var gold := 2		#お金

var speed := 40
var dir := Vector2.ZERO

#シグナル接続をラムダ関数で記述してみた。_on_body_enteredなどのメソッドを別途定義せずにconnect内で直接コードを書いている。

func _ready() -> void:
	#プレイヤーがVisibleAreaに侵入したらTakoが寄ってくる
	%VisibleArea.connect("body_entered", func(body: Node2D) -> void:
		dir = position.direction_to(get_tree().get_first_node_in_group(&"player").position)
	)

	#プレイヤーがVisibleAreaを出たらTakoはランダムな方向に彷徨う
	%VisibleArea.connect("body_exited", func(body: Node2D) -> void:
		dir = Vector2(randf_range(-1, 1), randf_range(-1, 1))
	)

func _physics_process(delta: float) -> void:
	velocity = dir * speed
	move_and_slide()




