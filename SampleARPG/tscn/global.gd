extends Node2D

#プレイヤーのステータス
var player_state = {
	lv = 1,		#レベル
	hp = 3,		#体力
	mp = 1,		#魔法
	power = 2,	#力
	defense = 2,#守り
	fortune = 3,#幸運
	exp = 0,	#経験値
	gold = 0	#お金
}

var player_pos := Vector2.ZERO	#プレイヤーの遷移先座標を一時的に記憶する変数
 


