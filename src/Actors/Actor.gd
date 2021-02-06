extends KinematicBody2D
class_name Actor


## currently dont want any gravity affecting the character
export var speed: = Vector2(300.0, 300.0)
#export var gravity: = 3000.0
var _velocity: = Vector2.ZERO
## currently dont want any gravity 
#func _physics_process(delta: float) -> void:

#	_velocity.y += gravity * delta
#	_velocity.y = max(speed.y, _velocity.y)

