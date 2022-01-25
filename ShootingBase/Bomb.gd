extends Area2D

#　特記事項　===================================================================
#AnimaitionPlayerにAudioStreamPlayerを内包し音とアニメーションを同時に再生させている。
#Particles2Dで爆発時に火花が出るようにしている。
#コリジョンなどの設定はいらないのでなし。
#物理衝突などはないためルートにArea2Dを使っている
#=============================================================================

#初期化
func start(pos):
	position = pos										#初期位置を設定

#メインプロセス
func _process(delta):									
	$AnimationPlayer.play("bomb")						#爆発アニメーションを再生

#アニメーションが終了した際に呼び出される関数	
func _on_AnimationPlayer_animation_finished(anim_name):	#爆発アニメーションが終わったら
	queue_free()										#爆発削除
