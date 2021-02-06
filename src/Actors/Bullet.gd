extends KinematicBody2D

var velocity = Vector2()
var DIRECTION = Vector2()
var SPEED = 10


func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(DIRECTION * SPEED, SPEED * delta)
	move_and_slide(velocity)
	
func init(direction: Vector2) -> void:
	print(direction)
	DIRECTION = direction
