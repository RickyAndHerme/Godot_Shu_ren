extends Area2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const bomb := preload("res://tscn/Bomb.tscn")
const fire := preload("res://tscn/tekishot1.tscn")

var vec := Vector2.ZERO				#ベクトルを０で初期化
var speed := 80						#スピード
var shoottime := 150 - Global.level	#弾を発射する間隔

#初期化：出現位置を指定
func start(pos):
	position = pos

#プロセス
func _process(delta: float) -> void:
	position.y += speed * delta		#y座標にspeedを足してdeltaをかける
	$AnimationPlayer.play("rot")	#アニメーション再生
	rotation -= 0.1					#スプライト回転
	shoot()							#弾を撃つ関数を呼び出す
	
	if position.y > 480:			#画面下を抜けたら削除
		queue_free()
		
	shoottime -= 1					#shoottimeを1減らす

#死亡時の処理
#スコア+1して爆発エフェクトを呼び出し、自分自身は削除する。
func hit():
	Global.score += 1
	var b := bomb.instantiate()
	get_parent().add_child(b)
	b.start(position)
	queue_free()

#弾発射処理
func shoot():
	if shoottime < 0:					#shooottimeが0より小さいなら
		var f := fire.instantiate()		#弾のインスタンス作る
		get_parent().add_child(f)		#ノードに追加
		f.start(position)				#弾の初期位置を指定
		shoottime = 150 - Global.level	#shooottimeを150に戻す(Global.levelが上がると発射間隔が短くなる)

