extends Node2D

func _ready() -> void:
	%Switch1.connect(&"hashi_kakeru", _on_hashi_kakeru)
	%Switch2.connect(&"hashi_kakeru_2", _on_hashi_kakeru_2)
	$"/root/Global/PlayerState".visible = true

#スイッチが押され「hashi_kakeru」シグナルを受け取ると橋が架かるメソッド

#レイヤー0番のタイル位置(19,12)の海のタイルをコリジョンなしの海のタイルに置き換える。
#レイヤー1番に橋のタイルを配置する。
#(注：コリジョンが設定されているタイルの上に橋を重ねても通行できないため、一旦海のタイルをコリジョンなしのものに置き換えてから橋を重ねている)
func _on_hashi_kakeru() -> void:
	%BaseMap.set_cell(0, Vector2i(19, 12), 5, Vector2i(0, 0), 0)
	%BaseMap.set_cell(1, Vector2i(19, 12), 4, Vector2i(3, 1), 0)
	
#もう一つのスイッチ。上記と似たようなもの
func _on_hashi_kakeru_2() -> void:
	%BaseMap.set_cell(0, Vector2i(30, 5), 5, Vector2i(0, 0), 0)
	%BaseMap.set_cell(1, Vector2i(30, 5), 4, Vector2i(3, 1), 7)	#最後の引数7は橋を90度回転させてた代替タイルを指定している
