extends Area2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const bomb := preload("res://tscn/Bomb.tscn")
const player := preload("res://tscn/Player.tscn")

var vec := Vector2.ZERO		#ベクトル
var speed := 100			#弾の移動スピード

#初期化：狙い弾
func start(pos):
	#発射位置をposで指定
	position = pos
	
	#「get_first_node_in_group(&"player")」でプレイヤーキャラの有無を確認し、ライフが0でなければ、
	#プレイヤー座標 - 狙い弾座標をvecに代入する
	#プレイヤーが存在していなければ、ベクトルは下方向にする
	if get_tree().get_first_node_in_group(&"player") and Global.life != 0:
		vec = get_tree().get_first_node_in_group(&"player").position - position
	else:
		vec = Vector2.DOWN
		
	#ベクトルの正規化
	vec = vec.normalized()
	#atan2で狙う方向を定める
	rotation = atan2(vec.y, vec.x)

#プロセス
func _process(delta: float) -> void:
	#弾の移動処理
	position += vec * speed * delta
	
	#範囲処理
	if position.x > 640 or position.x < 0 or position.y > 480 or position.x < 0:
		queue_free()

#弾が当たったときに呼び出す関数
#爆発エフェクトが発生し、弾を削除する
func hit():
	var b := bomb.instantiate()
	get_parent().add_child(b)
	b.start(position)
	queue_free()
