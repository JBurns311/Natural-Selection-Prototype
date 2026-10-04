class_name Player extends CharacterBody2D

const SPEED = 300.0

var input_direction: Vector2 = Vector2.ZERO

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: StateMachine = $StateMachine

#state imports
@onready var idle_state: State = $StateMachine/PlayerIdle
@onready var walk_state: PlayerWalk = $StateMachine/PlayerWalk
@onready var basic_attack_state: PlayerBasicAttack = $StateMachine/PlayerBasicAttack
@onready var combo_attack_state: PlayerComboAttack = $StateMachine/PlayerComboAttack


func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	input_direction = Input.get_vector("left", "right", "up", "down")
