extends State

var move_input = Vector2.ZERO

func handle_input():
	move_input = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		move_input.x = 1
	if Input.is_action_pressed("ui_left"):
		move_input.x = -1
	
	if _parent is Player:
		_parent.apply_move_input(move_input)


func physics_process(_delta):
	if _parent.is_on_floor():
		_parent.state_machine.travel("IDLE")


func apply_movement(_delta, _velocity):
	_velocity.x += move_input.x * _parent.AIR_ACC * _delta
	_velocity.y = _velocity.y + _parent.gravity * _delta
	return _velocity
