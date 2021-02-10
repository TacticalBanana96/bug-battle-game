extends Button

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_tree().get_root().get_node("TestLevel").get_node("PauseOverlay")

func _on_button_up() -> void:
	get_tree().paused = false
	scene_tree.paused = false
	pause_overlay.visible = false


