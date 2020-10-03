extends KinematicBody2D

# Member variables:
export var speed = 200  # pixels/sec
var screen_size
var time = 0.0
var offset

const WOBBLE_FREQ_V = 4  # vertical wobble frequency
const WOBBLE_AMP_V = 3 # vertical wobble amplitude

# Called when node first enters the scene tree:
func _ready():
	screen_size = get_viewport_rect().size
	#hide()

# Called every frame:
func _process(delta):  # delta = delta time
	# get velocity from button presses:
	var velocity = Vector2()  # set to zero
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	# play or stop sprite animation based on velocity:
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	if velocity.x != 0:
		$AnimatedSprite.animation = "fall"
		$AnimatedSprite.flip_h = velocity.x > 0
	
	time += delta
	offset = WOBBLE_AMP_V * sin(time*WOBBLE_FREQ_V)
	position.y += offset
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

# start player at position:
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
