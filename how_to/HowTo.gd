extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var toggle = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$HowToControl.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		if not $HowToControl.visible:
			$HowToControl.show()
			get_tree().paused = true

		else:
			$HowToControl.hide()
			get_tree().paused = false


#	pass
