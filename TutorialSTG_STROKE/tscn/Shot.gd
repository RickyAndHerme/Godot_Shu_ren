extends Area2D

var vec = Vector2.UP	#ショットのベクトルを格納
var speed = 500			#ショットのスピード

#ショットの発射音を再生する。_ready()が呼び出されたときに再生するので一回だけ音が鳴らせるようだ。
func _ready():
	$"/root/Global/PlayerShot".play()

#初期化
func start(x, y):
	position.x = x
	position.y = y

#プロセス
func _process(delta):
	$AnimationPlayer.play("shot_kirakira")	#アニメーション再生
	position += vec * speed * delta			#ショットの移動
	
	if position.y < 0:	#画面外に出たら消す
		queue_free()

#ショットとの当たり判定
#ショットに当たったものがenemyグループだった場合、hit関数を呼び出してショット削除		
func _on_Shot_area_entered(area):
	if area.is_in_group("enemy"):
		area.hit()
		queue_free()
