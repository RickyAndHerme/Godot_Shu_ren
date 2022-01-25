extends Node2D

#　特記事項　===================================================================
#_ready関数でプレイヤーノードをGlobal変数に格納している。
#理由はfire.tscnでプレイヤーの座標を必要とするためである。
#他の方法としてPlayerノードを自動読み込みに追加してどこのシーンからでも参照できるようにする方法もある。
#スコアの表示を行っている。Global.scoreを文字列に変換しているだけ。
#=============================================================================

var poptime = 20						#敵の出現間隔を調整する変数
var ene = preload("res://Enemy.tscn")	#Main.tscnが「Enemy.tscn」を使用するので事前読み込みしておく

func _ready():
	Global.playernode = get_node("Player")	#PlayerノードをGlobal変数に格納する

#メインプロセス
func _process(delta):
	if poptime < 0:						#poptimeが0以下ならば
		var e = ene.instance()			#敵のインスタンスを作成(複製する)
		e.start(randi()%Global.view_w)	#敵の出現位置を「画面横幅」内でランダムに決める
		get_parent().add_child(e)		#Mainシーンの子として敵を追加する
		poptime = 20					#poptimeを20に戻す
	
	poptime -= 1	#poptimeを1ずつ減らす
	
	if Global.score <= 0: Global.score = 0	#スコアが0以下になるときは0にする
	
	#スコアの加算(ScoreラベルにGlobal.scoreを文字列型に変換して追記している)
	$Score.text = "SCORE: " + str(Global.score)
