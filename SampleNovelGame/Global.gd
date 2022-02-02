extends CanvasLayer

var mes = []		#シナリオテキスト格納用
var label = []		#ジャンプ先ラベル格納用
var lines = 0		#行数カウント用
var mode = false	#ゲーム中のモード(false:テキストモード、true:イベントモード)
var gameflag = 0	#ゲーム進行フラグ
var curr_scn = null	#現在のシーンツリー格納用
	
#フェードイン/アウト付きでシーン遷移を行う関数
func scene_move(path):
	Global.label = ""								#Global.labelを空にする
	Global.lines += 1								#次の行に移動
	$ColorRect.show()								#ColorRectを表示する
	$AnimationPlayer.play("Fade")					#AnimationPlayerの「Fade」を再生する(フェードアウト)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	curr_scn = get_tree()
	$AnimationPlayer.play_backwards("Fade")			#「Fade」を逆再生する(フェードイン)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
	Global.mode = false								#イベントモード解除
	
#イベントモード中に次のシナリオ行へ進ませる
func nextline():
	Global.lines += 1								#次の行に移動
	Global.mode = false								#イベントモード解除
	
#テキストファイルの読み込み
#(シナリオとなるテキストファイルを読み込み、1行ずつ配列に格納する処理)
func load_text(fname):
	mes.clear()								#mes配列をクリアして空っぽにする
	lines = 0								#テキスト現在行を0で初期化
	var file = File.new()					#File.new()でファイルオブジェクトを作成する
	if file.open(fname, File.READ) == 0:	#エラーがなければfnameのファイルパスを「読み取り専用(READ)」で開く
		while !file.eof_reached():			#「ファイルの終端」が来るまで以下の処理を繰り返す
			mes.append(1)					#最後尾に配列要素を1つ追加(.push_back(1)でも可)
			mes[lines] = file.get_line()	#現在行の内容を取得しlines行のmes配列に代入する
			lines += 1						#1行進める
	file.close()							#ファイルを閉じる(＊while処理中に書かず外側の最後に書くこと)
	
#BGM再生
func play_music():
	if !$AudioStreamPlayer.is_playing():	#BGMが再生中でなければ
		$AudioStreamPlayer.play()			#BGMを再生

#BGM停止
func stop_music():
	$AudioStreamPlayer.stop()
