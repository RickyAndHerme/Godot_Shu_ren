extends CanvasLayer

#===============================================
#フェードアウト/インでシーンを切り替える
#===============================================
func fade(path):
	%AnimationPlayer.play("fade")
	await get_tree().create_timer(1.0).timeout		#1秒停止している
	get_tree().change_scene_to_file(path)
	%AnimationPlayer.play_backwards("fade")
	await get_tree().create_timer(1.0).timeout
	%AnimationPlayer.play("RESET")



