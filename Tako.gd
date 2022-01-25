extends Area2D



#プレイヤーの攻撃が当たったときの処理
#当たったものが剣のコリジョン(SwordHitBox)であればTakoを消す
func _on_Tako_area_entered(area):
	if area.get_name() == "SwordHitBox":
		queue_free()

#プレイヤーが接触したときの処理
#プレイヤーの色を変える。今の所色を戻す処理は入れてない
func _on_Tako_body_entered(body):
	if body.get_name() == "Player":
		body.set_modulate("ff8800")

