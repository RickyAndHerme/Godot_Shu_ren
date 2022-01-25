extends Node2D

var end = false	#終了フラグ

func _ready():
	Global.stop_music()	#BGMを停止する

func _process(delta):
	if end == false:									#終了フラグがfalseならば
		$AnimationPlayer.play("move")					#アニメーション「move」を再生
		yield($AnimationPlayer, "animation_finished")	#moveが終わるまで待機
		$Button.visible = true							#「はじめる」ボタンを表示
		end = true										#endをtrueにする(アニメーションが再度再生されないようにするため)

func _on_Button_pressed():
	Global.scene_move("res://1ietokawa.tscn")	#「はじめる」ボタンを押すとシーンを移動する
