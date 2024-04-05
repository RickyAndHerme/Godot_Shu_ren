extends CharacterBody2D

var lv := 1			#レベル
var hp := 5			#体力
var mp := 0			#魔法
var power := 2		#力
var defense := 1	#守り
var	exp := 2		#獲得経験値
var gold := 3		#獲得ゴールド

var speed := 80				#移動速度
var dir := Vector2.RIGHT	#方向

#シグナル接続をラムダ関数で記述してみた。_on_body_enteredなどのメソッドを別途定義せずにconnect内で直接コードを書いている。

func _ready() -> void:
	#プレイヤーがVisibleAreaに侵入したらObakeが寄ってくる
	%VisibleArea.connect(&"body_entered", func(body: Node2D) -> void:
		dir = position.direction_to(get_tree().get_first_node_in_group(&"player").position) * speed
	)
	
	#プレイヤーがVisibleAreaを出たらObakeは逆方向に彷徨う
	%VisibleArea.connect(&"body_exited", func(body: Node2D) -> void:
		dir = position.direction_to(get_tree().get_first_node_in_group(&"player").position) * -speed
	)

func _physics_process(delta: float) -> void:
	velocity = dir
	move_and_slide()

