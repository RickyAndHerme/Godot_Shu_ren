extends KinematicBody2D

#　特記事項　===================================================================
#AnimaitionPlayerにAudioStreamPlayerを内包し音とアニメーションを同時に再生させている。
#articles2Dでショットのキラキラが出るようにしている。
#=============================================================================

var vec = Vector2()					#ベクトル2型を作成
var speed = 10						#ショットのスピード

#初期化
func start(pos):
	position = pos					#初期位置を設定

#メインプロセス
func _physics_process(delta):
	$AnimationPlayer.play("Shot")			#アニメーションを再生
	position += Vector2(0, -speed)			#移動処理
	
	if position.y < -64:					#画面外に出たら
		queue_free()						#ショット削除
	
	#ショットが当たったときの処理	
	var col = move_and_collide(vec * delta)	#衝突情報をcolに入れる(ベクトルにdeltaを掛けたその瞬間の情報を格納している？)
	if col:									#衝突情報があれば
		if col.collider.has_method("hit"):	#「hit」関数を持つやつがいれば(例えばEnemy)
			col.collider.hit()				#そいつの「hit」関数を呼び出す
			Global.score += 5				#スコア獲得
			queue_free()					#ショットを削除
