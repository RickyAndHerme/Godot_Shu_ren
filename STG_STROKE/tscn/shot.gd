extends Area2D

var vec := Vector2.UP	#ショットのベクトルを格納
var speed := 500     			#ショットのスピード

func _ready() -> void:
	#ショットの発射音を再生する。_ready()が呼び出されたときに再生するので一回だけ音が鳴らせる。
	$"/root/Global/PlayerShot".play()

	#Shotノードに物体が衝突した際に発せられる組み込みシグナルを接続
	area_entered.connect(_on_area_entered)

#初期化
func start(x, y):
	position.x = x
	position.y = y

#プロセス
func _process(delta: float) -> void:
	$AnimationPlayer.play(&"shot_kirakira")	#アニメーション再生
	position += vec * speed * delta			#ショットの移動
	
	if position.y < 0:	#画面外に出たら消す
		queue_free()

#ショットとの当たり判定
#ショットに当たったものがenemyグループだった場合、hit関数を呼び出してショット削除		
func _on_area_entered(area):
	if area.is_in_group(&"enemy"):
		area.hit()
		queue_free()
