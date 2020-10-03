extends KinematicBody2D

# Member variables:
export var speed = 200  # pixels/sec
var screen_size

# Called when node first enters the scene tree:
func _ready():
	screen_size = get_viewport_rect().size
	#hide()

# Called every frame:
func _process(delta):  # delta = time
	# get velocity from button presses:
	var velocity = Vector2()  # set to zero
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	# play or stop sprite animation based on velocity:
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	# update position based on velocity:
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

# start player at position:
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
