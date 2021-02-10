extends KinematicBody2D
const SHOOT_DELTA = .2
const PROJECTILE =  preload("res://src/Actors/Bullet.tscn")

onready var timer = get_node("Timer")

func _physics_process(delta: float) -> void:
	var direction = get_global_mouse_position()
	look_at(direction)
	if(Input.get_action_strength("shoot") && timer.get_time_left() == 0):
		shoot()
		restart_timer()


func shoot() -> void:
	var bullet = PROJECTILE.instance()
	var testLevel = get_tree().get_root().get_node("TestLevel")
	var bulletDirection = (get_node("MeasurementPosition").get_global_position() - get_node("GunPosition").get_global_position()).normalized()
	testLevel.add_child(bullet)
	bullet.set_position(get_node("GunPosition").get_global_position())
	bullet.init(bulletDirection)


func restart_timer():
	timer.set_wait_time(SHOOT_DELTA)
	timer.set_one_shot(true)
	timer.start()

func _on_Timer_timeout() -> void:
	timer.set_one_shot(false)
