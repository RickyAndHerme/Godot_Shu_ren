extends Area2D

#Bomb、tekishot2をpreloadする。preloadすると先にリソースを読み込んでおくためパフォーマンスが向上する。
#これに対するloadはloadがスクリプトで呼ばれたときに読み込みを開始する。
var bomb = preload("res://tscn/Bomb.tscn")
var fire = preload("res://tscn/tekishot2.tscn")

var vec = Vector2.ZERO				#ベクトルを０で初期化
var speed = 50						#スピード
var shoottime = 200 - Global.level	#弾を発射する間隔

#初期化：出現位置を指定
func start(pos):
	position = pos

#プロセス：Emenyとほとんど同じ
func _process(delta):
	position.y += speed * delta
	$AnimationPlayer.play("move")
	shoot()
	
	if position.y > 480:
		queue_free()
		
	shoottime -= 1


#死亡時の処理
#スコア+2して爆発エフェクトを呼び出し、自分自身は削除する。
func hit():
	Global.score += 2
	var b = bomb.instance()
	b.start(position)
	get_parent().add_child(b)
	queue_free()

#弾発射処理
func shoot():
	if shoottime < 0:								#shoottimeが0より小さければ
		for i in range(Global.level/8):				#forを「Global.level/6」の回数回す
			var f = fire.instance()					#弾のインスタンス作成
			f.start(position.x, position.y, i)		#弾の初期位置を指定、iの数だけ360度方向に発射する
			get_parent().add_child(f)				#ノードに追加
			shoottime = 200 - Global.level			#shooottimeを200に戻す(Global.levelが上がると発射間隔が短くなる)
