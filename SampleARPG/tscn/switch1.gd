extends Area2D

#橋掛けシグナル(1と2で分けているが共有化したいところ)
signal hashi_kakeru

func _ready() -> void:
	body_entered.connect(_on_body_entered)

#スイッチが押されたらグラフィックを変更し、シグナルを飛ばす
func _on_body_entered(body):
	if %Sprite.frame != 3:
		$"/root/Global/Switch_SE".play()
		%Sprite.frame = 3
		emit_signal(&"hashi_kakeru")
