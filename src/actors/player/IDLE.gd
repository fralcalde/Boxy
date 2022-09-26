extends State

func handle_input():
	if Input.is_action_pressed("ui_right"):
		_parent.state_machine.travel("MOVE")
	if Input.is_action_pressed("ui_left"):
		_parent.state_machine.travel("MOVE")
	if Input.is_action_pressed("ui_up"):
		_parent.state_machine.travel("JUMP")


func apply_movement(_delta, _velocity):
	_velocity.x = lerp(_velocity.x, 0, _parent.GROUND_FRICTION)
	return _velocity
