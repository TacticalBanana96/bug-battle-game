extends KinematicBody2D
const SHOOT_DELTA = 4
var projectile
# TODO: Move firing logic to player
func _physics_process(delta: float) -> void:
	var direction = get_global_mouse_position()
	var bullet = load("res://src/Actors/Bullet.tscn")
	if(Input.get_action_strength("shoot")):
		shoot(direction)
		print("SHOOT")
	look_at(direction)

func _ready():
	set_process(true)
	projectile =  load("res://src/Actors/Bullet.tscn")


func shoot(direction: Vector2) -> void:
	#spawn a projectile
	var bullet = projectile.instance()
	bullet.init(direction)
	#.init(direction)
	#add_child(bullet)
	var testLevel = get_tree().get_root().get_node("TestLevel")
	print(testLevel)
	testLevel.add_child(bullet)
	#add_child_below_node(get_tree().get_root().get_node("TestLevel"),bullet)
