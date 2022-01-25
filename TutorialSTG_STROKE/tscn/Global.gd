extends Node2D

var score = 0		#スコア
var hiscore = 100	#ハイスコア
var level = 1		#ゲームレベル
var life = 1		#プレイヤーのライフ
var jikinode = null	#プレイヤーノード格納用

#BGM再生処理：nameでノード名を指定	
func change_music(name:String):
	if !get_node("/root/Global/" + name).is_playing():	#nameで指定したBGMが再生中でなければ
		get_node("/root/Global/" + name).play()			#再生する
	else:
		get_node("/root/Global/" + name).stop()			#再生中であれば止める


