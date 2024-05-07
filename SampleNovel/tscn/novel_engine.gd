extends RichTextLabel

#シナリオテキストは行頭に指定記号を書く。

# #@：		「改ページ」　ページを新しくして次のテキストに進む。
# /@XXX：	「イベントラベル」　@の後ろにラベル名を書く。イベントモードがONになりテキスト表示を一旦停止できる。選択肢やシーンの移動などを行いたいときに使う。
# .@XXX		「ラベルジャンプ」　特定のラベルにジャンプできる
# なし：	記号がなければ「ボタン入力待ち」

#text01、text02.txtの中身も参照されたし。

#　シナリオテキストの解説(例：3dekake.gd)　==============================
# ……それはうさぎでした。	→ボタン入力待ち
# たぬきは動揺しました。	→ボタン入力待ち
# #@					→改ページ
# そして……				→ボタン入力待ち
# /@隠れるか否か			→「隠れるか否か」ラベルに飛ぶ。イベントモードがONになりそのシーンの具体的な演出がスクリプトで実行される。
#===================================================================

var count := 0			#文字をカウントする(1文字ずつカウントするプロパティがないため変数を用いる)
var btnwait := false	#ボタン待ち状態

func _ready() -> void:
	start()

#テキスト表示の仕組み：
#シナリオデータが格納されたGlobal.mes配列の中身をGlobal.linesが示す現在行で先にtextプロパティに読み込ませる。
#次にvisible_charactersでcount数ずつ文字の表示数を上げていく。
#countがNovelEngineノード内の文字数を超えそうになったらそこで止めて、ボタン入力待ちにする。
#現在行に指定記号があった場合はmatch文で各処理を行う。それ以外はcountをアップする。
func _process(delta: float) -> void:
	#イベントモード中でなく、シーン遷移アニメーションが再生中でなければ
	if Global.mode == false && $"/root/Global/AnimationPlayer".current_animation == "":
		visible_characters = count					#count分だけ文字を表示する
		if get_total_character_count() <= count:	#NovelEngineの文字総数をcountが超えようとしたら
			count = get_total_character_count()		#countをNovelEngineの文字総数にする
			
			#左クリックされ、ボタン入力待ちであれば
			if Input.is_action_just_pressed(&"LMB") && btnwait == true:
				var regex := RegEx.new()		#正規表現を使用するためのオブジェクト
				regex.compile("[▼]")			#正規表現を使って「▼」を割り当てる
				text = regex.sub(text, "\n")	#見つかったら「▼」を改行コードに置き換える
				btnwait = false

			#linesがmes配列の要素数を超えておらず、且つボタン入力待ちでなければ
			if Global.lines < Global.mes.size() && btnwait == false:
				var order = Global.mes[Global.lines].split("@", true, 1)	#シナリオデータを指定記号と文章に分離してorderに格納する
				match order[0]:
					#改ページ
					"#":
						text = ""			#テキストを消去する
						count = 0			#文字カウントを0にする
						Global.lines += 1	#order[1]が空ならばシナリオを次の行に進める
					#イベントラベル
					"/":
						Global.mode = true		#イベントモードをONにする
						Global.label = order[1]	#現在行のラベル名を格納
					#ラベルジャンプ
					".":
						Global.lines = Global.mes.find("/@" + order[1])	#ラベルがある行数をlinesに格納
						count = get_total_character_count()
						Global.mode = false
					#その他
					_:
						text += order[0]						#指定記号が含まれていない行はorder[0]にテキストが格納されている。
						text += "[wave amp=25 freq=25]▼[/wave]"	#bbcodeで記述したボタン待ちアニメーションをテキストに追加
						Global.backlog.add_text(order[0] + "\n")#バックログにテキスト追加
						Global.lines += 1						#シナリオを次の行に進める
						btnwait = true

		else:
			count += get_tree().get_first_node_in_group(&"slider").value	#文字カウントをテキストの速度設定の速さで進める。

#初期化
func start() -> void:
	visible = true
	process_mode = Node.PROCESS_MODE_INHERIT
	text = ""
	count = 0
	position = Vector2(128, 72)

#指定したラベルにジャンプする(スクリプト上で使用)
func label_jump(lab: String) -> void:
	Global.lines = Global.mes.find("/@" + lab)	#ラベルがある行数をlinesに格納
	count = get_total_character_count()
	Global.mode = false
