extends RigidBody2D

signal eaten
var rotation_speed 
export var min_speed = 300  
export var max_speed = 400  

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_speed = 2
	$AnimatedSprite.rotation += -rotation_speed*PI*delta

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()

func _on_Collectable_body_entered(body):
	if body.get_name() == 'Player':
		emit_signal("eaten")
		queue_free()
