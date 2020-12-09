extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$CloudAnimation01.play("Cloud01")
	$CloudAnimation02.play("Cloud02")
	$CloudAnimation03.play("Cloud03")

