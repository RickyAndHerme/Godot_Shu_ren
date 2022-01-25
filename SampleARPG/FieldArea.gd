extends Node2D

#スイッチが押されシグナルを受けると橋がかかるメソッド
func _on_Switch1_hashi_kakeru():
	$BaseMap.set_cell(19, 12, 3)	#マップ上のタイル位置(19,12)を橋のID(3)に置き変える。

func _on_Switch2_hashi_kakeru():	#上と同じようなもの
	$BaseMap.set_cell(30, 5, 3)
