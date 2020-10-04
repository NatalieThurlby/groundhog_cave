extends StaticBody2D

signal loop_cave

var looped = false
# Declare member variables here. Examples:
var gravity = -300
var hidden = false
var screen_size
var buffer = 100 # pixels

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	hidden = true
	screen_size = get_viewport_rect().size

func _process(delta):
	if not hidden:
		position.y += gravity * delta
		
		if ($WallSprite.texture.get_size().y + position.y < (screen_size.y+buffer)):
			if looped == false:
				emit_signal("loop_cave")
				looped = true

func _on_VisibilityNotifier2D_viewport_exited():
	if not hidden:
		queue_free()
