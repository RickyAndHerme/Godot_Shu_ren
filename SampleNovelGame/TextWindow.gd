extends Node2D

var end = true	#Tweenの終了状態を示すフラグ
onready var backlog = get_node("/root/GameMenu/ColorRect/TabContainer/バックログ/BackLog")

func _ready():
	visible = true				#TextWindowを表示する
	$Text.clear()
	$Text.percent_visible = 0
	
func _process(delta):
	if Input.is_action_just_pressed("Lclick") and end == true:
		show_text()

#一文字ずつテキストを表示する関数
#シナリオテキスト「text01.txt」の中身の通り、1行ずつ表示したら改ページする処理を行っっている。
func show_text():
	if Global.lines < Global.mes.size():
		end = false								#endをfalseする(Tweenが終了状態ではなくなる)			
		$Text.clear()
		$Text.percent_visible = 0
		$Text.text = Global.mes[Global.lines]
		
		#Tweenの「interpolate_property」を使用して、1行の表示文字のパーセンテージを徐々に上昇させることで一文字ずつ表示させている。
		#float($Text.get_total_character_count())で浮動小数点にキャストしたものを50で割って表示速度を一定に保っている。
		$Tween.interpolate_property($Text, "percent_visible", 0, 1, $Text.get_total_character_count() as float/50, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Tween.start()
	backlog.add_text($Text.text + "\n")
	Global.lines += 1

#Tweenが終了したら実行されるシグナル
func _on_Tween_tween_completed(object, key):
	$Text.append_bbcode("[wave amp=25 freq=25]▽[/wave]")
	end = true
