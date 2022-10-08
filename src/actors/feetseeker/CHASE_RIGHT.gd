extends State

signal collided

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func physics_process(_delta):
	# Set velocity or acceleration so we chase to the right.
	_parent._velocity = lerp(_parent._velocity, Vector2(_parent.MAX_SPEED, 0), _parent.VEL_LERP_SPEED)
	var collision = _parent.move_and_collide(_parent._velocity)
	
	if collision:
		emit_signal("collided")
