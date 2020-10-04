extends KinematicBody2D

# Member variables:
var velocity = Vector2()  

export var speed = 500  # pixels/sec
var acceleration = 0.75
var air_resistance = 0.2

var time = 0.0

var screen_size

var bounce_speed = 300
var bounce = false

const WOBBLE_FREQ_V = 4  # vertical wobble frequency
const WOBBLE_AMP_V = 3 # vertical wobble amplitude

# Called when node first enters the scene tree:
func _ready():
	screen_size = get_viewport_rect().size
	hide()

	$AnimatedSprite.play()

# Called every frame:
func _process(delta):  # delta = delta time
	# get velocity from button presses:
	var dir_x = 0
	if bounce != true:
		velocity = Vector2()  # set to zero
		if Input.is_action_pressed("ui_right"):
			dir_x += 1
		if Input.is_action_pressed("ui_left"):
			dir_x -= 1
			
		if dir_x !=0:
			velocity.x = lerp(velocity.x, dir_x * speed, acceleration)
		else:
			velocity.x = lerp(velocity.x, 0, air_resistance)
			
		if dir_x != 0:
			$AnimatedSprite.flip_h = dir_x > 0
			
	time += delta
	var offset = WOBBLE_AMP_V * sin(time*WOBBLE_FREQ_V)
	position.y += offset
	position.y = clamp(position.y, 0, screen_size.y)
	
	# collision with static body: TODO: move to physics process?
	var collision = move_and_collide(velocity * delta)
	if collision is KinematicCollision2D and collision.collider.is_in_group("wall"):
		var bounce_vector = Vector2(collision.normal.x, 0).normalized()
		var bounce_velocity = velocity.bounce(bounce_vector)
		bounce = true
		$BounceTimer.start()
		velocity += bounce_velocity.normalized() * bounce_speed
		$AnimatedSprite.flip_h = bounce_vector.x > 0
	
	position.x += velocity.x * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
# start player at position:
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_BounceTimer_timeout():
	bounce = false
	$BounceTimer.stop()
