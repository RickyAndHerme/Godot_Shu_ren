extends CanvasLayer

#1.新規シーンに「CanvasLayer」を用意し、その子に「ColorRect」と「AnimationPlayer」を作る。
#2.ColorRectはデフォルトで非表示にする(目玉のマークを閉じる)
#(デフォルトでColorRectが表示されていると、マウスクリックする際に
#ColorRectを選択しようとするため、キャラ選択時に何も反応しなくて困るためである)
#3.AnimationPlayerではColorRectの「Color」プロパティのアルファチャンネル(A)を0～255で1秒間アニメーションさせている。
#4.scene_move関数を書き、Global.tscnで保存。プロジェクト設定＞自動読み込みに読み込む。

#===============================================
#フェードイン/アウト付きでシーン遷移を行う関数
#===============================================
func scene_move(path):
	$ColorRect.show()								#ColorRectを表示する
	$AnimationPlayer.play("Fade")					#AnimationPlayerの「Fade」を再生する(フェードアウト)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	$AnimationPlayer.play_backwards("Fade")			#「Fade」を逆再生する(フェードイン)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
