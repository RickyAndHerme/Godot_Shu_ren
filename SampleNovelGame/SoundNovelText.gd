extends Node2D

#シナリオテキストは行頭に指定記号を書く。

#%@：	「改ページ」　ページを新しくして次のテキストに進む。
#*@XXX：	「イベントラベル」　@の後ろにラベル名を書く。イベントモードがONになりテキスト表示を一旦停止できる。選択肢やシーンの移動などを行いたいときに使う。
#なし：	記号がなければ「ボタン入力待ち」

#text01、text02.txtの中身も参照されたし。
#text01→text02などシナリオデータを移行する際に最終行にイベントラベルを記述すること。

#　シナリオテキストの解説(例：3dekake.gd)　==============================
# ……それはうさぎでした。	→ボタン入力待ち
# たぬきは動揺しました。		→ボタン入力待ち
# %@					→改ページ
# そして……				→ボタン入力待ち
# *@隠れるか否か			→「隠れるか否か」ラベルに飛ぶ。イベントモードがONになりそのシーンのスクリプトの具体的な演出が実行される。
#===================================================================

onready var backlog = get_node("/root/GameMenu/ColorRect/TabContainer/バックログ/BackLog")	#バックログノードを取得
onready var slider = get_node("/root/GameMenu/ColorRect/TabContainer/設定/textspeed/HSlider")	#テキストスピードスライダーを取得

var count = 0			#文字をカウントする変数
var speed = 0			#文字の表示速度(イベント時に使用)
var spflag = 1			#スピード調整フラグ
var regex = RegEx.new()	#正規表現を使用するためのオブジェクト
var btnwait = false

func _ready():
	visible = true	#SondNovelTextノードを表示する
	$Text.clear()

#テキスト表示の仕組み：
#シナリオデータが格納されたGlobal.mes配列をGlobal.linesが示す現在行を先にTextノードに読み込ませる。
#次にset_visible_charactersでcount数づつ文字の表示数を上げていく。
#countがTextノード内の文字数を超えそうになったらそこで止めて、ボタン入力待ちにする。
#現在行に指定記号があった場合はmatch文で各処理を行う。それ以外はcountをアップする。		
func _process(delta):
	if Global.mode == false:							#演出モード中でなければ
		$Text.set_visible_characters(count)				#count分だけ文字を表示する
		if $Text.get_total_character_count() <= count:	#$Textの文字総数をcountが超えようとしたら
			count = $Text.get_total_character_count()	#countを$Textの文字総数にする
			
			if Input.is_action_just_pressed("Lclick") and btnwait == true:		#左クリックされ、ボタン入力待ちが表示されていたら
				regex.compile("[▽]")						#正規表現を使って▽を検索する
				$Text.text = regex.sub($Text.text, "\n")	#見つかったら▽を改行コードに置き換える
				btnwait = false
					
			if Global.lines < Global.mes.size() and btnwait == false:	#linesがmes配列の要素数を超えていないなら
				#シナリオ文章と指定記号を「@」で分割してPoolStringArrayという配列に格納するが、
				#match文では判定ができないためArray型にキャストしている
				var order = Array(Global.mes[Global.lines].split("@", true, 1))						
				match order:
					["%", _]:							#"%"：改ページ記号
						$Text.text = ""						#テキストを消去する
						count = 0							#文字カウントを0にする
						Global.lines += 1					#シナリオを次の行に進める
					["*", _]:							#"*"：イベントモード記号
						Global.mode = true					#イベントモードをONにする
						Global.label = order[1]				#現在行のラベル名を格納
					_:							#その他
						$Text.text += order[0]				#指定記号が含まれていない行はorder[0]にテキストが格納されている。
						$Text.append_bbcode("[wave amp=25 freq=25]▽[/wave]")	#ボタン待ちアニメーションをbbcodeで表示「▽」
						backlog.add_text(order[0] + "\n")	#バックログにテキスト追加
						Global.lines += 1					#シナリオを次の行に進める
						btnwait = true
		else:
			count += (slider.value * spflag) + speed	#文字カウントを進める。イベント時にspflagを0にし任意のspeed値で表示速度を調整できる

#特定のラベルにジャンプするメソッド
func labeljump(label):												#label：ジャンプしたいラベル名を入れる
	Global.lines = Global.mes.find("*@"+label)						#ラベル名を格納
	count = $Text.get_total_character_count()						#countを0にする
	Global.mode = false												#イベントモードを解除する
	

