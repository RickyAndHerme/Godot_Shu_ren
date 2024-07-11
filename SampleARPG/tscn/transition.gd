extends CanvasLayer

#===============================================
#モザイクトランジション
#===============================================
#mosaic.gdshaderも参照。
#アニメーションを再生　→　0.5秒待機　→　シーンを切り替え　→　アニメーション逆再生　→　0.5秒待機　→　アニメーションリセット
func mosaic_transition(path) -> void:
	var tw = create_tween()
	tw.tween_callback(%AnimationPlayer.play.bind(&"mosaic"))
	tw.tween_interval(0.5)
	tw.tween_callback(get_tree().change_scene_to_file.bind(path))
	tw.tween_callback(%AnimationPlayer.play_backwards.bind(&"mosaic"))
	tw.tween_interval(0.5)
	tw.tween_callback(%AnimationPlayer.play.bind(&"RESET"))
	
#===============================================
#フェードアウト/イン
#===============================================
#手順はモザイクトランジションと同様	
func fade(path) -> void:
	var tw = create_tween()
	tw.tween_callback(%AnimationPlayer.play.bind(&"fade"))
	tw.tween_interval(0.5)
	tw.tween_callback(get_tree().change_scene_to_file.bind(path))
	tw.tween_callback(%AnimationPlayer.play_backwards.bind(&"fade"))
	tw.tween_interval(0.5)
	tw.tween_callback(%AnimationPlayer.play.bind(&"RESET"))
