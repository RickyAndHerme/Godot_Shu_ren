extends Area2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const enemy := preload("res://tscn/Enemy.tscn")

#出現音を再生する。_ready()が呼び出されたときに再生するので一回だけ音が鳴らせる。
func _ready() -> void:
	$"/root/Global/Sound_Appear1".play()

#初期化：出現位置は画面内でランダム	
func start():
	randomize()
	position.x = randi() % 640
	position.y = randi() % 480

#プロセス：アニメーションを再生
func _process(delta: float) -> void:
	$AnimationPlayer.play("ups")

#アニメーション終了判定のシグナルを接続する
#enemyのインスタンスを作り、enemyのノードをペアレントする
#startで出現位置をappear1と同じ位置にし、queue_freeでappear1を削除。
func _on_AnimationPlayer_animation_finished(anim_name):
	var e := enemy.instantiate()
	get_parent().add_child(e)
	e.start(position)
	queue_free()
	
