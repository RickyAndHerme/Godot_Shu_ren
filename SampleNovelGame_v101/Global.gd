extends CanvasLayer

var mes = []	#シナリオテキスト格納用の配列
var lines = 0	#行数カウント用
var mode = false#ゲーム中のモード(false:テキストモード、true:イベントモード)
var gameflag = 0#ゲーム進行フラグ

#SceneMoveサンプルと同じ遷移機能を実装しているが一応ここでも解説を入れておく。

#1.新規シーンに「CanvasLayer」を用意し、その子に「ColorRect」と「AnimationPlayer」を作る。
#2.ColorRectは画面全体を覆うサイズにし、デフォルトで非表示にする(目玉のマークを閉じる)
#(デフォルトでColorRectが表示されていると、マウスクリックする際にColorRectを選択してしまうため、他のものが選択できない)
#3.AnimationPlayerではColorRectの「Color」プロパティのアルファチャンネル(A)を0～255で1秒間アニメーションさせている。
#4.scene_move関数を書き、Global.tscnで保存。プロジェクト設定＞自動読み込みに読み込む。


#フェードイン/アウト付きでシーン遷移を行う関数
func scene_move(path):
	$ColorRect.show()								#ColorRectを表示する
	$AnimationPlayer.play("Fade")					#AnimationPlayerの「Fade」を再生する(フェードアウト)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	get_tree().change_scene(path)					#シーンを切り替える
	$AnimationPlayer.play_backwards("Fade")			#「Fade」を逆再生する(フェードイン)
	yield($AnimationPlayer, "animation_finished")	#「Fade」が終了するまでここで待機
	$ColorRect.hide()								#ColorRectを非表示にする
	Global.mode = false								#演出モードOFF
		
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
