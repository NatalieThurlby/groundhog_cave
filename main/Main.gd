extends Node

export (PackedScene) var Collectable
var time_left
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	new_game()

func game_over():
	$AppleTimer.stop()
	$GameTimer.stop()
	
func new_game():
	score = 0
	time_left = 10
	$Player.start($PlayerStart.position)
	$StartTimer.start()
	
func _on_GameTimer_timeout():
	time_left -= 1

func _process(delta):
	if time_left > 0:
		print(score)
	if time_left <= 0:
		game_over()
		print('game over')

func _on_AppleTimer_timeout():
	# choose random point on the path, and initiate apple there:
	$AppleSpawnPath/AppleSpawnLoc.offset = randi()
	var apple = Collectable.instance()
	add_child(apple)
	apple.position = $AppleSpawnPath/AppleSpawnLoc.position
	# make direction perpendicular to path:
	var direction = $AppleSpawnPath/AppleSpawnLoc.rotation + PI / 2
	# add some randomness to the direction:
	direction += rand_range(-PI / 4, PI / 4)
	apple.rotation = direction
	# Set the velocity (speed & direction).
	apple.linear_velocity = Vector2(rand_range(apple.min_speed, apple.max_speed), 0)
	apple.linear_velocity = apple.linear_velocity.rotated(direction)
	
	apple.connect("eaten", self, "_on_apple_eaten")

func _on_StartTimer_timeout():
	$GameTimer.start()
	$AppleTimer.start()

func _on_apple_eaten():
	score += 1
