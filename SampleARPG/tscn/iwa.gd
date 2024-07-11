extends CharacterBody2D


#岩がプレイヤーに押された場合の処理
#moveメソッドの引数がプレイヤーの押している方向を受け取る(player.gdも参照)
func move(dir):
	%RayCast2D.target_position = dir * 15	#target_positionにプレイヤー方向＊15を代入してタイルサイズからはみ出さない長さにしておく
	%RayCast2D.force_raycast_update()		#レイキャストの情報を即座に更新する
	if !%RayCast2D.is_colliding():			#レイキャストに物体が触れていなければ
		position += dir						#岩が押されている方向に動かす
