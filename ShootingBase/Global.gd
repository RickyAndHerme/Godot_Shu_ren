extends Node

#　特記事項　===================================================================
#1.新規シーンに「CanvasLayer」を用意し、その子に「ColorRect」と「AnimationPlayer」を作る。
#2.ColorRectはデフォルトで非表示にする(目玉のマークを閉じる)
# (デフォルトでColorRectが表示されていると、マウスクリックする際に全面にあるColorRectを選択してしまうため、
#ColorRectより下にあるオブジェクト類を選択できない)
#3.AnimationPlayerではColorRectの「Color」プロパティのアルファチャンネル(A)を0～255で1秒間アニメーションさせている。
#4.scene_move関数を書き、Global.tscnで保存。プロジェクト設定＞自動読み込みに読み込んでいる。
#=============================================================================

var view_w = 640	#画面の横幅
var view_h = 360	#画面の縦幅
var score = 100		#スコア
var playernode = null	#Playerノードを格納するための変数

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
