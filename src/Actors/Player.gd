extends Actor

const ACCELERATION = 400
const MAX_SPEED = 300
const FRICTION = 600

func _physics_process(delta: float) -> void:
	var direction: = get_direction().normalized()
	if direction != Vector2.ZERO:
		_velocity = _velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	else:
		_velocity = Vector2.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move()

func get_direction() -> Vector2:
	return Vector2(
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

func move() -> void:
	move_and_slide(_velocity)

func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	acceleration: int
) -> Vector2:
	var out = linear_velocity
	out = acceleration * direction.normalized()
	return out
