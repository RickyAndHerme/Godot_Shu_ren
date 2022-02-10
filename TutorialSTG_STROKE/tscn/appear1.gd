extends Area2D

#Enemyをpreloadする。preloadすると先にリソースを読み込んでおくためパフォーマンスが向上する。
#これに対するloadはloadがスクリプトで呼ばれたときに読み込みを開始する。
const enemy = preload("res://tscn/Enemy.tscn")

#出現音を再生する。_ready()が呼び出されたときに再生するので一回だけ音が鳴らせるようだ。
func _ready():
	#$"root/Global/Sound_Appear1".play()
	pass

#初期化：出現位置は画面内でランダム	
func start():
	randomize()
	position.x = randi() % 640
	position.y = randi() % 480

#プロセス：アニメーションを再生
func _process(delta):
	$AnimationPlayer.play("ups")

#アニメーション終了判定のシグナルを接続する
#enemyのインスタンスを作り、startで出現位置をappear1と同じ位置にする。
#enemyのノードをペアレントし、queue_freeでappear1を削除。
func _on_AnimationPlayer_animation_finished(anim_name):
	var e = enemy.instance()
	e.start(position)
	get_parent().add_child(e)
	queue_free()
	
