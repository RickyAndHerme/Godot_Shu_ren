extends KinematicBody2D

export (int) var speed = 100

#プレイヤーの状態
enum {MOVE, ATTACK}

var state = MOVE		#プレイヤー状態を格納
var vec = Vector2.ZERO	#ベクトル
var dir = Vector2.ZERO	#プレイヤーの向いている方向

func _ready():
	pass
	
func _physics_process(delta):
	#プレイヤー状態の判定
	match state:
		MOVE:
			vec = Vector2.ZERO
			if Input.is_action_pressed("ui_right"):
				vec = Vector2.RIGHT
				dir = Vector2.RIGHT
			elif Input.is_action_pressed("ui_left"):
				vec = Vector2.LEFT
				dir = Vector2.LEFT
			if Input.is_action_pressed("ui_down"):
				vec = Vector2.DOWN
				dir = Vector2.DOWN
			elif Input.is_action_pressed("ui_up"):
				vec = Vector2.UP
				dir = Vector2.UP
			
			$AnimationTree.set("parameters/Walk/blend_position", dir)	#AnimationTreeのWalkとブレンドポジションをセットする	
			$AnimationTree.get("parameters/playback").travel("Walk")	#Walkアニメーションに遷移
			vec = vec.normalized() * speed
		
			#プレイヤーが衝突した物体のコリジョン情報を取得し、
			#その物体が「ok_push」グループならばmoveメソッドを呼び出す
			var col = move_and_collide(vec * delta)
			if col:
				if col.collider.is_in_group("ok_push"):
					col.collider.move(dir)
		
			#スペースキーでステータスを攻撃状態にする
			if Input.is_action_just_pressed("ui_accept"):
				state = ATTACK

		ATTACK:
			#攻撃状態に入るとプレイヤーの向いている方向に攻撃する
			#本当はAnimationTreeを使いたいがわけわからんなったので今はこれでガマン。後で直す。
			match dir:
				Vector2.RIGHT:
					$AnimationPlayer.play("attack_right")
				Vector2.LEFT:
					$AnimationPlayer.play("attack_left")
				Vector2.DOWN:
					$AnimationPlayer.play("attack_down")
				Vector2.UP:
					$AnimationPlayer.play("attack_up")
			
			#アニメーションが終了するまで処理を待機し、終了したら移動状態に戻る
			yield($AnimationPlayer, "animation_finished")
			state = MOVE
