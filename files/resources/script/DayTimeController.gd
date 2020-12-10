extends Node

# Day = 0 Night = 1
export var timesetted = 1
export var current = 0
# Visibility of stars
var stars_visible = false
# Signal to set the time to day
signal time_day
# Signal to set the time to night
signal time_night

# Executes when entering scene_tree
func _ready():
	time_update(current)
	
# Executes every frame
func _process(_delta):
	_time_changed()

# Smothly displays the change of time
func timeset(time_value):
	if time_value == 0:
		$Amanhecer.play("Amanhecer")
	elif time_value == 1:
		$Anoitecer.play("Anoitecer")
		if stars_visible == false:
			$ShiningStars.play("StarsVisibility")
			stars_visible = true

# Set the current time without transitions
func time_update(current_time):
	if current_time == 0:
		$Night/DarkBlue.color = Color(0, 0, 0, 0)
		$Night/Black.color = Color(0, 0, 0, 0)
	if current_time == 1:
		$Night/DarkBlue.color = Color("#8c060028")
		$Night/Black.color = Color("#64131322")
		
# Updates the current time when timeset animation was displayed
func update_current(time_value):
	current = time_value
	time_update(current)
	
# Update the time when morning comes
func _on_Amanhecer_animation_finished(_anim_name):
	update_current(timesetted)

# Update the time when the night falls
func _on_Anoitecer_animation_finished(anim_name):
	update_current(timesetted)
	
# Changes the Stars animation when they become visible
func _on_ShiningStars_animation_finished(anim_name):
	if anim_name == "StarsVisibility":
		$ShiningStars.play("AnoitecerStars")

# Changes the timesetted to day when signal recieved
func _on_DayLightCicle_time_day():
	timesetted = 0

#Changes the timesetted to night when signal recieved
func _on_DayLightCicle_time_night():
	timesetted = 1

#When the time is changed, it updates
func _time_changed():
	if current != timesetted:
		timeset(timesetted)
