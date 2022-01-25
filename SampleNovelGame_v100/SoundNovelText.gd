extends Node2D

#文章の行末に指定記号を書く。
#@+「連結」：改行せずにテキストを続けて表示する。
#@%「改ページ」：ページを新しくして次のテキストに進む。
#@*「演出モード」：演出モードがONになる。各tscnのスクリプト側に具体的な記述を行っている。
#　　選択肢やシーンの移動などテキストを止めたまま処理を行いたいときに使う。
#なし：行末に記号がなければ「ボタン入力待ち」
#text02.txtの中身も参照されたし。

#　解説　=============================================================
#……それはうさぎでした。	→テキストが行末に来ると自動で「ボタン入力待ち」　入力があれば改行して次の文章に行く。
#たぬきは動揺しました。		→同じくここも「ボタン入力待ち」
#@%						→行頭に「@%」だけ書くと「改ページ」を行う
#そして……@+				→ページの1行目に来る文章は連結記号「@+」がいる。連結記号は「ボタン入力待ち」後、改行せずに次の文章を表示する。
#@*						→行頭に「@*」だけ書くと「演出モード」がONになる
#===================================================================

var count = 0	#文字をカウントする変数
var speed = 1.0	#文字の表示スピード

func _ready():
	visible = true							#SondNovelTextを表示する
	$Text.set_visible_characters(count)		#表示文字数を0で初期化
			
func _process(delta):
	if Global.mode == false:							#演出モード中でなければ
		$Text.set_visible_characters(count)				#count分だけ文字を表示する
		if $Text.get_total_character_count() <= count:	#$Textの文字総数をcountが超えようとしたら
			count = $Text.get_total_character_count()	#countを$Textの文字総数にする
			$btnmachi.visible = true					#ボタン入力待ちを表示する
			if Input.is_action_just_pressed("click") and $btnmachi.visible == true:	#左クリックされ、ボタン入力待ちが表示されていたら
				$btnmachi.visible = false	#ボタン入力待ちを非表示にする
				for i in 2:					#forループを2回指定(行末で絶対にボタン入力待ちが入るため、2回判定を行うことでスキップを実現している)
					if Global.lines < Global.mes.size():							#linesがmes配列のサイズを超えていないなら
						var order = Global.mes[Global.lines].split("@", true, 1)	#シナリオ文章と指定記号を「@」で分割して配列に格納する
						order = Array(order)	#分割したデータを配列型に変換する(変換前はPoolStringArrayで格納されていてうまく扱えないため)
						match order:			#指定記号を判定していく
							[_, "+"]:	#"+"：テキスト連結
								$Text.text += order[0]	#シナリオテキストを$Textに追加する
								break					#ループ抜ける
							[_, "%"]:	#"%"：改ページ
								$Text.text = ""			#テキストを消去する
								count = 0				#文字カウントを0にする
								Global.lines += 1		#シナリオデータを次の行に進める
							[_, "*"]:	#"*"：演出モード
								Global.mode = true		#演出モードをONにする
								break					#ループ抜ける
							_:			#指定記号以外
								$Text.text += "\n"+order[0]	#改行＋テキストを代入する
								break					#ループ抜ける
				Global.lines += 1	#格納されたシナリオデータを次の行に進める	
		else:
			count += speed	#文字カウントを進める

#特定の行数にジャンプする関数
func textjump(j):												#j：ジャンプしたいシナリオ行を入れる
	Global.lines = j-1											#シナリオj行目に移動
	var order = Global.mes[Global.lines].split("@", true, 1)	#シナリオ文章と指定記号を「@」で分割して配列に格納する
	order = Array(order)										#分割したデータを配列型に変換する(変換前はPoolStringArrayで格納されていてうまく扱えないため)
	$Text.text = order[0]										#シナリオj行を$Textに格納する
	count = 0													#countを0にする
	Global.lines += 1											#シナリオ行を1つ進める
	Global.mode = false											#演出モードを解除する
	

