extends Node2D

func _ready() -> void:
	if !$"/root/Global/BGM_yoitenki".playing: $"/root/Global/BGM_yoitenki".play()
	Global.save.start_label = "ゲーム開始"
	Global.save.text_name = "text01"

func _process(delta: float) -> void:
	#シナリオデータに「*@XXX」で記述されたラベル名にジャンプする
	#ラベルにジャンプするとイベントモードがONになりテキスト表示が一旦停止する。その間に選択肢、立ち絵の表示、シーン遷移などを行える。

	match Global.label:
		"ゲーム開始":
			Global.next_line()
		"アスピリン":
			Global.scene_move("res://tscn/2_gyunyu.tscn")		#次のシーンへ移動
