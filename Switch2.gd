extends Area2D

#橋掛けシグナル
signal hashi_kakeru

#スイッチ2に触れたときの処理
#スイッチが押されたグラフィックに変更し、シグナルを飛ばす
func _on_Switch2_body_entered(body):
	$Sprite.frame = 3
	emit_signal("hashi_kakeru")
