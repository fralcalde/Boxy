class_name State
extends Node
# Base interface for all states: it doesn't do anything by itself,
# but forces us to pass the right arguments to the methods below
# and makes sure every State object had all of these methods.

onready var _parent = $"../.."

func handle_input():
	pass


func physics_process(_delta):
	pass
