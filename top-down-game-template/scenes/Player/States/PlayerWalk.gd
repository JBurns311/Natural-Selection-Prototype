class_name PlayerWalk extends State

var player: Player = parent as Player

func init(state_actor: CharacterBody2D) -> void:
	parent = state_actor
	player = parent as Player

func enter() -> void:
	player.sprite.play("walk")

func physics_update(_delta: float) -> void:
	var input_velocity = player.input_direction * player.SPEED
	
	if player.input_direction.x < 0:
		player.sprite.flip_h = true
	elif player.input_direction.x > 0:
		player.sprite.flip_h = false
	
	# User doesn't have exact control over velocity if external force throws them
	player.velocity.x = move_toward(player.velocity.x, input_velocity.x, player.SPEED)
	player.velocity.y = move_toward(player.velocity.y, input_velocity.y, player.SPEED)
	player.move_and_slide()
	
	
	if Input.is_action_just_pressed("primary_action"):
		state_transition.emit(player.basic_attack_state)
	elif player.input_direction == Vector2.ZERO:
		state_transition.emit(player.idle_state)
