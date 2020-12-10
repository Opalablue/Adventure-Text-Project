extends Node

# Preloads the time controller
var TimeController = preload("res://resources/node/DayTimeController.tscn")
var scene_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Time_Layer.get_child_count() == 0:
		$Time_Layer.add_child(TimeController.instance())
		$Time_Layer.get_child(0).notification(NOTIFICATION_READY)
		
