extends Node2D

#　特記事項　===================================================================
#start関数でプレイヤーの位置を取得する処理を入れている。
#プレイヤーノードはGlobal.gdに定義した変数にMain.tscn上で格納している。
#fireがヒットしたときに爆発が起こりfireが消える。
#ルートにKinematicBody2Dを使っているがArea2Dでもいいと思う。
#=============================================================================

var bomb = preload("res://Bomb.tscn")
var vec = Vector2()					#ベクトル2型を作成
var speed = 100

#初期化
func start(pos):
	position = pos												#初期位置を設定
	vec = Global.playernode.global_position - global_position	#Player-Fireで2点間のベクトルを取得する
	vec = vec.normalized()										#ベクトルの正規化
	global_rotation = atan2(vec.y, vec.x)						#xとyからプレイヤーがいる角度を求めfireの進行方向を決定する
		
func _physics_process(delta):
	position += vec * speed * delta			#上で求めたプレイヤーがいる方向にfireを移動させる
		
	if position.y > Global.view_h+8:		#画面外に出たら
		queue_free()						#fire削除
	
#ヒットしたときの処理
func hitp():
	var b = bomb.instance()			#爆発インスタンスを作成
	b.start(position)				#爆発の初期値を敵の位置に設定
	get_parent().add_child(b)		#子に追加(インスタンスを作成しただけではシーンに追加されておらず表示されないためここで追加)
	queue_free()					#fireを削除


