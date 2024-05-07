extends CanvasLayer

@onready var nve := $NovelEngine
@onready var backlog := get_tree().get_first_node_in_group(&"backlog")
@onready var gamemenu = get_tree().get_first_node_in_group(&"game_menu")

var mes: PackedStringArray	#シナリオテキスト格納用
var lines := 0				#現在のシナリオ行
var label := ""				#現在のラベル名
var mode := false			#ゲーム中のモード(false:テキストモード、true:イベントモード)

#セーブデータ1,2のサムネイルを読み込む
var img = [Image.load_from_file("user://save_ss1.png"), Image.load_from_file("user://save_ss2.png")]

#セーブ用辞書データ
var save: Dictionary = {
	time = 0,
	tscn = "",
	start_label = "",
	text_name = "",
	gameflag = 0,
}

#ゲームフラグの列挙型
enum flag{
	UGOKENAI = 1,
	KAKURERU = 2,
	
	HAZURERU = 4,
	SONOMAMA = 8,

	AKERU = 16,
	TAIKISURU = 32
}

#フェードイン/アウト付きでシーン遷移を行う関数
func scene_move(path) -> void:
	if mes.size() > 0: next_line()
	gamemenu.visible = false
	Global.nve.btnwait = false
	Global.nve.start()
	Global.gamemenu.visible = false
	var tw = create_tween()
	tw.tween_callback(%AnimationPlayer.play.bind(&"fade"))
	tw.tween_interval(1.0)
	tw.tween_callback(get_tree().change_scene_to_file.bind(path))
	tw.tween_callback(%AnimationPlayer.play_backwards.bind(&"fade"))
	tw.tween_interval(1.0)
	tw.tween_callback(%AnimationPlayer.play.bind(&"RESET"))
	tw.tween_callback(func() -> void:
		mode = false
	)

#イベントモード中に次のシナリオ行へ進ませる
func next_line():
	label = ""
	lines += 1		#次の行に移動
	mode = false	#イベントモード解除

#シナリオとなるテキストファイルを読み込み、1行ずつ配列に格納している
func load_text(fname):
	lines = 0			#テキスト現在行を0で初期化
	mes.clear()			#配列を空にする	
	var file = FileAccess.open(fname, FileAccess.READ)	#シナリオファイルを開いてfileオブジェクトを作成する
	if file:								#ファイルの中身が存在していれば
		while !file.eof_reached():			#「ファイルの終端」が来るまで以下の処理を繰り返す
			mes.append(file.get_line())		#配列要素を1つ追加し、シナリオを1行配列に読み込む
	file.close()							#ファイルを閉じる(while処理中に書かず外側に書くこと)
	label = ""
	mode = false

