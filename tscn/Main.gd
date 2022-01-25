extends Node2D

#appear1、2をpreloadする。preloadすると先にリソースを読み込んでおくためパフォーマンスが向上する。
#これに対するloadはloadがスクリプトで呼ばれたときに読み込みを開始する
var ups = preload("res://tscn/appear1.tscn")
var ups2 = preload("res://tscn/appear2.tscn")

var time = 30		#敵出現までの時間
var dietime = 100	#プレイヤー死亡後の待機時間

func _ready():
	Global.jikinode = $Player			#プレイヤーノード格納
	Global.change_music("Music_Stage")	#BGM再生

#プロセス
func _process(delta):
	#timeが0未満になったら敵出現処理
	#ゲームレベルが10を超えるとEnemy2が出現するようになる
	#敵が出現したらtimeを100に戻す(Global.levelが上がると出現間隔が短くなる)
	#後はtimeを-1し続ける
	if time < 0:
		enemyborn(ups)
		if Global.level > 10:
			enemyborn(ups2)
		time = 100 - Global.level
	else:
		time -= 1
	
	#レベル*2よりスコアが高ければレベルを1上げる
	if Global.score > 3 * Global.level:
		Global.level += 1
	
	#スコアの表示
	if Global.score > Global.hiscore: Global.hiscore = Global.score
	$hiscore.text = "HI-SCORE:" + str(Global.hiscore)
	$score.text = "SCORE:" + str(Global.score)
	
	#プレイヤーが死亡した後、dietimeが0になるまで待機し、ゲームオーバー画面へ遷移
	if Global.life == 0:
		dietime -= 1
		if dietime < 0:
			Transition.fade("res://tscn/GameOver.tscn")

#敵出現
func enemyborn(ene):
	var u = ene.instance()
	u.start()
	get_parent().add_child(u)
