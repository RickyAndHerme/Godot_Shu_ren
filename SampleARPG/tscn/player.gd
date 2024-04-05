extends CharacterBody2D
 
#プレイヤーの状態
enum {MOVE, ATTACK, DAMAGE, DEATH}

var state := MOVE		#プレイヤー状態を格納
var vec := Vector2.DOWN	#ベクトル
var dir := Vector2.DOWN #プレイヤーの向き
var speed := 100		#移動速度

#gateway.gdでシーン遷移先のプレイヤー座標がGlobal.player_posに保存されており、それをプレイヤー座標に代入してプレイヤー位置を決めている。
func _ready() -> void:
	%SwordHitBox.body_entered.connect(_on_SwordHitBox_body_entered)
	$AnimationTree.set(&"parameters/Walk/blend_position", dir)
	position = Global.player_pos

func _physics_process(delta: float) -> void:
	#プレイヤー状態の判定
	match state:
		MOVE:
			if $"/root/Transition/AnimationPlayer".current_animation == "":
				vec = Input.get_vector(&"left", &"right", &"up", &"down")
				if Input.get_vector(&"left", &"right", &"up", &"down"):
					dir = vec
				$AnimationTree.set(&"parameters/Walk/blend_position", dir)	#AnimationTreeのWalkとブレンドポジションの方向をdirでセットする	
				$AnimationTree.get(&"parameters/playback").travel(&"Walk")	#Walkアニメーションに遷移
				vec *= speed * delta
			
				#プレイヤーが衝突した物体のコリジョン情報を取得する(この辺りの処理は分離したいところ)
				var col = move_and_collide(vec)
				if col:
					#物体が「ok_push」グループならばmoveメソッドを呼び出す(岩を押す)
					if col.get_collider().is_in_group(&"ok_push"):
						col.get_collider().move(vec)
					
					#物体が「enemy」グループならば明滅してプレイヤーがダメージを受ける
					elif col.get_collider().is_in_group(&"enemy"):
						get_node("/root/Global/PlayerState/Life/Label/Life" + str(Global.player_state.hp)).visible = false
						Global.player_state.hp -= 1
						$Damage_SE.play()
						state = DAMAGE
						

				#スペースキーでステータスを攻撃状態にする
				if Input.is_action_just_pressed(&"space"):
					state = ATTACK
		
		ATTACK:
			$AnimationTree.set(&"parameters/Attack/blend_position", dir)	#AnimationTreeのAttackとブレンドポジションの方向をdirでセットする
			$AnimationTree.get(&"parameters/playback").travel(&"Attack")	#Attackアニメーションに遷移
			state = MOVE

		DAMAGE:
			#ダメージ中のノックバック処理
			var tw = create_tween()
			tw.tween_property(%Sprite, "modulate", Color("ff1111"), 0.1)
			tw.tween_property(%Sprite, "modulate", Color("ffffff"), 0.1)
			tw.set_parallel()
			tw.tween_property(self, "position", position + -dir * 30, 0.1).set_ease(Tween.EASE_IN)
			tw.tween_callback(func() -> void: state = MOVE if Global.player_state.hp > 0 else DEATH)

		#体力が0になるとタイトルに戻される
		DEATH:
			$"/root/Global/PlayerState".visible = false
			Transition.fade("res://tscn/Title.tscn")
	
#プレイヤーの剣が敵に当たるとノックバックする。倒すと経験値とゴールドが手に入る
func _on_SwordHitBox_body_entered(body):
	if body.is_in_group(&"enemy"):
		$Attack_SE.play()
		var tw = create_tween()
		tw.tween_property(body, "modulate", Color("ff1111"), 0)
		tw.tween_property(body, "modulate", Color("ffffff"), 0.2)
		tw.set_parallel()
		tw.tween_property(body, "position", body.position + dir * 30, 0.1).set_ease(Tween.EASE_IN)
		body.hp -= 1
		if body.hp == 0:
			Global.player_state.exp += body.exp
			Global.player_state.gold += body.gold
			body.queue_free()
