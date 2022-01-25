extends Node2D

var end = true	#Tweenの終了状態を示すフラグ

func _ready():
	visible = true				#TextWindowを表示する
	$Text.percent_visible = 0	#テキスト1行分の表示文字パーセンテージを0で初期化
	
func _process(delta):
	$btnmachi.visible = end										#ボタン待ちアイコンの表示/非表示をend変数で管理
	if Input.is_action_just_pressed("click") and end == true:	#左クリックされたら
		show_text()												#テキストを表示関数を実行

#一文字ずつテキストを表示する関数
#Tweenの「interpolate_property」を使用して、1行の表示文字のパーセンテージを徐々に上昇させることで一文字ずつ表示させている。
#シナリオテキスト「text01.txt」の中身の通り、1行ずつ表示したら改ページする処理を行っっている。
func show_text():
	if Global.lines < Global.mes.size():		#linesがmes配列のサイズを超えていないなら
		end = false								#endをfalseする(Tweenが終了状態ではなくなる)
		$Text.percent_visible = 0				#テキスト1行分の表示文字パーセンテージを0で初期化
		$Text.text = Global.mes[Global.lines]	#mes配列のliensが示す行のテキストを$Textに代入する
		
		#表示文字のパーセンテージを0→1に向かって上昇させる設定
		#float($Text.get_total_character_count())で浮動小数点にキャストしたものを50で割って表示速度を一定に保っている。
		$Text/Tween.interpolate_property($Text, "percent_visible", 0, 1, float($Text.get_total_character_count())/50, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		$Text/Tween.start()		#Tweenを開始する
		Global.lines += 1			#linesに1行分足す

#Tweenが終了したら実行されるシグナル
func _on_Tween_tween_completed(object, key):
	end = true	#終了を示すフラグ
