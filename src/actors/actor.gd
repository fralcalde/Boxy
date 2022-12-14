class_name Actor
extends KinematicBody2D


onready var gravity = ProjectSettings.get("physics/2d/default_gravity")

const FLOOR_NORMAL = Vector2.UP

var _velocity = Vector2.ZERO

func _physics_process(delta):
	_velocity.y = _velocity.y + gravity * delta
	_velocity = move_and_slide(_velocity, Vector2.UP)
