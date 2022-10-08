class_name HurtBox
extends Area2D

signal hit


func _init() -> void:
	collision_layer = 0
	collision_mask = 8


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox:
		emit_signal("hit")
