extends CanvasLayer

#モザイクで画面遷移する処理をシェーダーで実装した。詳しくはmosaic.shaderファイルを参照。
#フェードアウト/インもTweenの「interpolate_property」で実装。
#「interpolate_property」は指定したプロパティのパラメーターをA～B間でアニメーションする。イージングも使える。

#===============================================
#モザイクトランジション
#===============================================
func mosaic_transition(path):
	$ColorRect.show()								#ColorRectを表示する
	$Tween.interpolate_property($ColorRect.get_material(), "shader_param/size", 0, 0.16, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#Tweenが終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	$Tween.interpolate_property($ColorRect.get_material(), "shader_param/size", 0.16, 0, 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#Tweenが終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
	
	
#===============================================
#フェードアウト/イン
#===============================================	
func fade(path):
	$ColorRect.show()								#ColorRectを表示する
	$Tween.interpolate_property($ColorRect, "modulate", Color("00000000"), Color("ff000000"), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#「Tweenがが終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	$Tween.interpolate_property($ColorRect, "modulate", Color("ff000000"), Color("00000000"), 0.5, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Tween.start()
	yield($Tween, "tween_completed")				#Tweenがが終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
	

