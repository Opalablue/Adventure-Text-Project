extends Node

# Preloads the time controller
var TimeController = preload("res://resources/node/DayTimeController.tscn")
# Counter
var child_counter = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Time_Layer.get_child_count() == 0:
		$Time_Layer.add_child(TimeController.instance())
	else:
		for _n in range(child_counter, 1):
			$Time_Layer.get_child(0).emit_signal("time_night")
			$Time_Layer.get_child(0).notification(NOTIFICATION_READY)
			child_counter += 1
		
