extends Node2D

signal player_right
signal player_left

onready var ray_length = ProjectSettings.get("display/window/size/width") / 2

# Called when the node enters the scene tree for the first time.
func _ready():
	$RayLeft.cast_to = Vector2(-ray_length, 0)
	$RayRight.cast_to = Vector2(ray_length, 0)


func _physics_process(_delta):
	if($RayLeft.is_colliding() || $RayRight.is_colliding()):
		if($RayLeft.get_collider() is Player):
			emit_signal("player_left")
		if($RayRight.get_collider() is Player):
			emit_signal("player_right")

