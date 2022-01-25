extends Area2D

#橋掛けシグナル
signal hashi_kakeru

#スイッチ1に触れたときの処理
#スイッチが押されたグラフィックに変更し、シグナルを飛ばす
func _on_Switch1_body_entered(body):
	$Sprite.frame = 3
	emit_signal("hashi_kakeru")

