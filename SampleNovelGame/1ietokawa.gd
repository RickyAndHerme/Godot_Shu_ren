extends Node2D

func _ready():
	Global.load_text("res://media/text01.txt")	#text01.txtの読み込み
	Global.lines = 0							#テキスト現在行を0で初期化
	Global.play_music()							#BGMを再生する

		
func _process(delta):
	#シナリオデータに「*@XXX」で記述されたラベル名にジャンプする
	#ラベルにジャンプするとイベントモードがONになりテキスト表示が一旦止まる。その間に選択肢、立ち絵の表示、シーン遷移などなど何でもできる。

	match Global.label:
		"ゲーム開始":
			Global.nextline()
		"アスピリン":
			Global.scene_move("res://2gyunyu.tscn")		#次のシーンへ移動
	
	Global.label = ""	#イベント状態をmatchした後にラベルを空にしておく
