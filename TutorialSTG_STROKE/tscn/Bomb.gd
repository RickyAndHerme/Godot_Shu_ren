extends Area2D

#爆発音を再生する。_ready()が呼び出されたときに再生するので一回だけ音が鳴らせるようだ。
func _ready():
	$"/root/Global/Sound_Bomb".play()

#初期化：出現位置を指定。
func start(pos):
	position = pos

#プロセス：アニメーションを再生。
func _process(delta):
	$AnimationPlayer.play("Bomb")

#アニメーション終了判定のシグナルを接続したらqueue_freeでBomb削除
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
