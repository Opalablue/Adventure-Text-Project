extends Node

# Changes to first scene when start is pressed
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://resources/node/Scene01.tscn")
