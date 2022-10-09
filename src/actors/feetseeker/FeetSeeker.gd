class_name FeetSeeker
extends Actor

onready var state_machine = $StateMachine.get("parameters/playback")
onready var current_state = get_node("StateMachine/" + state_machine.get_current_node())

export var MAX_SPEED = 5
export var VEL_LERP_SPEED = 0.3


# Called when the node enters the scene tree for the first time.
func _process(_delta):
	$StateDebug.text = state_machine.get_current_node()


func _physics_process(_delta):
	current_state = get_node("StateMachine/" + state_machine.get_current_node())
	
	if current_state is State:
		current_state.physics_process(_delta)


func _on_HorizontalDetector_player_left():
	if state_machine.get_current_node() == "IDLE":
		state_machine.travel("CHASE_LEFT")


func _on_HorizontalDetector_player_right():
	if state_machine.get_current_node() == "IDLE":
		state_machine.travel("CHASE_RIGHT")


func _on_CHASE_RIGHT_collided():
	state_machine.travel("IDLE")


func _on_CHASE_LEFT_collided():
	state_machine.travel("IDLE")
