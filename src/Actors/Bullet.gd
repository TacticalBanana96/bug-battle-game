extends KinematicBody2D

var velocity = Vector2()
var DIRECTION = Vector2()
var ACCELERATION = 6000
var MAX_SPEED = 1000


func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(DIRECTION * MAX_SPEED, ACCELERATION * delta)
	move_and_slide(velocity)
	
#Calculates vector between the bullet origin and the mouse
func init(direction: Vector2) -> void:
	DIRECTION = direction

# Destroys the bullet when it is out of sight
func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
