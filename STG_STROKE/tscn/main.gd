extends Node2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const ups := preload("res://tscn/appear1.tscn")
const ups2 := preload("res://tscn/appear2.tscn")

var time := 30		#敵出現までの時間
var dietime := 100	#プレイヤー死亡後の待機時間

#BGMを再生(BGM自体にLoop設定しているので再生はこの1回でいい)
func _ready():
	Global.change_music("Music_Stage")

#プロセス
func _process(delta: float) -> void:
	#timeが0未満になったら敵出現処理
	#ゲームレベルが10を超えるとEnemy2が出現するようになる
	#敵が出現したらtimeを100に戻す(Global.levelが上がると出現間隔が短くなる)
	if time < 0:
		enemyborn(ups)
		if Global.level > 10:
			enemyborn(ups2)
		time = 100 - Global.level
	else:
		time -= 1
	
	#レベル*4よりスコアが高ければレベルを1上げる
	if Global.score > 4 * Global.level:
		Global.level += 1
	
	#スコアの表示
	if Global.score > Global.hiscore: Global.hiscore = Global.score
	%Hiscore.text = "HI-SCORE:" + str(Global.hiscore)
	%Score.text = "SCORE:" + str(Global.score)
	
	#プレイヤーが死亡した後、dietimeが0になるまで待機し、ゲームオーバー画面へ遷移
	if Global.life == 0:
		dietime -= 1
		if dietime < 0:
			get_tree().change_scene_to_file("res://tscn/GameOver.tscn")

#敵出現
func enemyborn(ene: PackedScene):
	var u := ene.instantiate()
	get_parent().add_child(u)
	u.start()
