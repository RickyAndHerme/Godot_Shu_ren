extends Area2D

#preloadはスクリプト解析時にリソースを読み込む。
#これに対してloadはスクリプトで実行されたときに読み込みを開始する。
#通常はpreloadでよいがload実行時にファイルパスが動的に変更される処理などを書きたいときはloadを使うと良い。
const shot := preload("res://tscn/Shot.tscn")
const bomb := preload("res://tscn/Bomb2.tscn")

var vec := Vector2.ZERO	#ベクトル
var rolltime := 20		#プレイヤー機の左右の傾きアニメーションの時間
var shottime := 8		#弾の発射間隔
var speed := 250		#プレイヤーの移動速度

func _ready() -> void:
	#Playerノードに物体が衝突した際に発せられる組み込みシグナルを接続
	area_entered.connect(_on_area_entered)

#プロセス
func _process(delta: float) -> void:
	#プレイヤーの移動処理
	#文字列に「&」をつけたものはStringName型を意味する。
	#「&」なしのString型でも動作するが、StringName型が引数に指定できる箇所では「&」をつけた方が高速に文字列を比較できる。
	vec = Input.get_vector(&"left", &"right", &"up", &"down")
	
	#rolltime値を使って左右に移動する際にボタンを押している長さで機体を傾きを制御
	if vec.x <= -1.0:
		if rolltime >= 0:
			rolltime -= 1
	elif !Input.is_action_pressed(&"left") and rolltime <= 20:	#左が押されて、rolltimeが20以下ならば
		rolltime += 1
		
	if vec.x >= 1.0:
		if rolltime <= 40:
			rolltime += 1
	elif !Input.is_action_pressed(&"right") and rolltime >= 29:	#右が押されて、rolltimeが29以上ならば
		rolltime -= 1
	
	#スペースキーが押され、shottimeが0未満なら弾を発射
	#ショットはs1、s2が並列して発射するため発射位置をずらしている。
	if Input.is_action_pressed(&"space") and shottime < 0:
		shottime = 8
		var s1 := shot.instantiate()
		var s2 := shot.instantiate()
		get_parent().add_child(s1)
		get_parent().add_child(s2)
		s1.start(position.x -10, position.y)
		s2.start(position.x +10, position.y)

	position += vec * speed * delta					#ベクトルにspeedとdeltaをかけている
	position.x = clamp(position.x, 0+15, 640-15)	#x方向の移動範囲処理
	position.y = clamp(position.y, 0+15, 480-15)	#y方向の移動範囲処理
	
	%Sprite.frame = rolltime/10								#rolltimeを10で割ることでプロパティのframe値を割り出している
	%JetAnimation.animation = &"jet" + str(rolltime/10)		#上と同じようにrolltimeを使ってAnimatedSprite2Dを切り替える
	shottime -= 1

#プレイヤーの当たり判定処理
func _on_area_entered(area: Area2D) -> void:
	#プレイヤーに当たったものがenemyグループだった場合、爆発エフェクトを作りライフを0にしてプレイヤー削除
	if area.is_in_group(&"enemy"):
		var b := bomb.instantiate()
		get_parent().add_child(b)
		b.start(position)
		Global.life = 0
		queue_free()
	
	#同じようにenemyshotグループに当たった場合、敵のhitメソッドを呼び出し、ライフを0にしてプレイヤー削除
	elif area.is_in_group(&"enemyshot"):
		Global.life = 0
		area.hit()
		queue_free()
