extends Node2D

#LOGO.tscn →Title.tscn →1ietokawa.tscn →2gyunyu.tscn →Oshimai.tscnの順にシーンは進行している

var end = false	#終了フラグ

func _process(delta):
	if end == false:													#終了フラグがfalseならば
		$kachikachi_team/AnimationPlayer.play("scale")					#アニメーション「scale」を再生
		yield($kachikachi_team/AnimationPlayer, "animation_finished")	#scaleが終わるまで待機
		end = true														#endをtrueにする(アニメーションが再度再生されないようにするため)
	if Input.is_action_just_pressed("click"):	#左クリックが押されたら
		Global.scene_move("res://Title.tscn")	#次のシーンに移動
