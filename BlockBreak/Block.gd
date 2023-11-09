extends StaticBody2D

#ボールがブロックにヒットした際の処理
func hit():
	Global.score += 1
	queue_free()
