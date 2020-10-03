extends CanvasLayer

#variables:
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	
	show_message("Game Over")
	# Wait for message timer to count down:
	yield($MessageTimer, "timeout")
	
	$Message.text = "Escape\nGroundhog Cave"
	$Message.show()
	yield(get_tree().create_timer(1), "timeout")

	$StartButton.show()

func _on_MessageTimer_timeout():
	$Message.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")

func update_score(score):
	$ScoreLabel.text = str(score)
	
	
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

