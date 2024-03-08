extends CanvasLayer

#===============================================
#フェードアウト/インでシーンを切り替える
#===============================================
#tween_callback内の各メソッドの最後にbind(引数)が指定されている。
#例えば「tw.tween_callback(%AnimationPlayer.play("fade"))」という書き方をするとエラーになる。
#理由はtween_callbackの引数はcallble型を取るためである。
#AnimationPlayer.playはcallable型を返さないので最後に.bind(引数)を指定することでcallableを返す事ができる。
func fade(path):
	var tw := get_tree().create_tween()
	tw.tween_callback(%AnimationPlayer.play.bind("fade"))
	tw.tween_callback(get_tree().change_scene_to_file.bind(path))
	tw.tween_callback(%AnimationPlayer.play_backwards.bind("fade"))
	await get_tree().create_timer(1.0).timeout
	tw.tween_callback(%AnimationPlayer.play.bind("RESET"))



