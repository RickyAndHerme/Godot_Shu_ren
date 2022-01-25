extends CanvasLayer

#「interpolate_property」は指定したプロパティのパラメーターをA～B間でアニメーションする。イージングも使える。
#===============================================
#フェードアウト/インでシーンを切り替える
#===============================================	
func fade(path):
	$ColorRect.show()								#ColorRectを表示する
	$Tween.interpolate_property($ColorRect, "modulate", Color("00000000"), Color("ff000000"), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#Tweenが終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	$Tween.interpolate_property($ColorRect, "modulate", Color("ff000000"), Color("00000000"), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#Tweenが終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
	

