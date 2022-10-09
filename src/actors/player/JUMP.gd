extends State

var move_input : Vector2 = Vector2.ZERO

func handle_input():
	move_input = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		move_input.y = -1
	if Input.is_action_just_released("ui_up"):
		move_input.y = 0
		_parent.state_machine.travel("FALL")
	if Input.is_action_pressed("ui_right"):
		move_input.x = 1
	if Input.is_action_pressed("ui_left"):
		move_input.x = -1
	
	
	if _parent is Player:
		_parent.apply_jump_input(move_input)
		_parent.apply_move_input(move_input)


func apply_movement(_delta, _velocity):
	_velocity.x += move_input.x * _parent.AIR_ACC * _delta
	_velocity.y =  -_parent.MAX_JUMP_SPEED
	return _velocity


func _on_JumpTimer_timeout():
	if _parent.state_machine.get_current_node() == "JUMP":
		_parent.state_machine.travel("FALL")
