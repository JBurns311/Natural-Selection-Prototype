class_name PlayerIdle extends State

var player: Player

func init(state_actor: CharacterBody2D) -> void:
	parent = state_actor
	player = parent as Player

func enter() -> void:
	player.sprite.play("idle")

func physics_update(_delta: float) -> void:
	# player velocity isn't zero in idle state move towards that
	# i.e friction/air resistance
	player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.velocity.y = move_toward(player.velocity.y, 0, player.SPEED)
	player.move_and_slide();
	
	if Input.is_action_just_pressed("primary_action"):
		state_transition.emit(player.basic_attack_state)
	elif player.input_direction != Vector2.ZERO:
		state_transition.emit(player.walk_state)
