extends Node2D

var end = false	#終了フラグ

func _ready():
	Global.gameflag = 0		#ゲームフラグをリセット
	Global.stop_music()		#BGMを停止する
	Global.curr_scn = null	#_ready()の中でこの一行を加えるとそのシーンでは右クリックメニューを呼び出さないようにできる

func _process(delta):
	if end == false:									#終了フラグがfalseならば
		$AnimationPlayer.play("move")					#アニメーション「move」を再生
		yield($AnimationPlayer, "animation_finished")	#moveが終わるまで待機
		$Button.visible = true							#「はじめる」ボタンを表示
		$Button2.visible = true							#「おわる」ボタンを表示
		end = true										#endをtrueにする(アニメーションが再度再生されないようにするため)

#はじめるボタン
func _on_Button_pressed():
	Global.scene_move("res://1ietokawa.tscn")	#「はじめる」ボタンを押すとシーンを移動する

#おわるボタン
func _on_Button2_pressed():
	get_tree().quit()
