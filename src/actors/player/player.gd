class_name Player
extends Actor

onready var state_machine = $StateMachine.get("parameters/playback")
onready var current_state = get_node("StateMachine/" + state_machine.get_current_node())

export var GROUND_ACC = 300.0
export var AIR_ACC = 150.0
export var MAX_GROUND_SPEED = 150.0
export var MAX_JUMP_SPEED = 100.0
export var GROUND_FRICTION = 0.05
export var AIR_FRICTION = 0.01
export var JUMP_TIME = 0.3

var _move_input = Vector2.ZERO

func _ready():
	$JumpTimer.wait_time = JUMP_TIME


func _process(_delta):
	$StateDebug.text = state_machine.get_current_node()
	handle_input()


func handle_input():
	current_state = get_node("StateMachine/" + state_machine.get_current_node())
	current_state.handle_input()


func apply_move_input(input : Vector2):
	_move_input.x = input.x


func apply_jump_input(input : Vector2):
	_move_input.y = input.y


func _physics_process(_delta):
	current_state = get_node("StateMachine/" + state_machine.get_current_node())
	
	if current_state is State:
		if current_state.has_method("apply_movement"):
			_velocity = current_state.apply_movement(_delta, _velocity)
		else:
			_velocity.x = lerp(_velocity.x, 0, GROUND_FRICTION)
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	if current_state is State:
		current_state.physics_process(_delta)
	
	# Update Sprite
	set_sprite_direction()


func set_sprite_direction():
	if _move_input.x < 0:
		$Sprite.flip_h = true
	elif _move_input.x > 0:
		$Sprite.flip_h = false


func _on_HurtBox_hit():
	state_machine.travel("DEAD")
