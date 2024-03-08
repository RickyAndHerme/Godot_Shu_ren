extends Area2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const bomb := preload("res://tscn/Bomb.tscn")

var vec := Vector2.DOWN	#ベクトル。下向きにしている
var speed := 150			#弾の移動スピード

#初期化：xとy、発射方向を指定
func start(x, y, rot):
	position.x = x
	position.y = y
	vec = vec.rotated(rot)
	vec = vec.normalized()

#プロセス：弾の移動処理、範囲処理
func _process(delta: float) -> void:
	position += vec * speed * delta
	
	if position.x > 640 or position.x < 0 or position.y > 480 or position.x < 0:
		queue_free()

#弾がヒットした際は爆発エフェクトを呼び出して、弾は消す処理
func hit():
	var b := bomb.instantiate()
	b.start(position)
	get_parent().add_child(b)
	queue_free()
