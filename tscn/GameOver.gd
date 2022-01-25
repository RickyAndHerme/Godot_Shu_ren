extends Node2D

#ハイスコアの表示のみ
func _process(delta):
	$hiscore.text = "HI-SCORE:" + str(Global.hiscore)

#タイマーが終了した際のシグナル接続
#レベル、スコア、プレイヤーのライフを初期化
func _on_Timer_timeout():
	Global.level = 1
	Global.score = 0
	Global.life = 1
	Global.change_music("Music_Stage")			#BGM再生中にBGMチェンジすると再生を止める
	Transition.fade("res://tscn/Title.tscn")	#タイトル画面に遷移
