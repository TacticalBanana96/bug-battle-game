extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var days: Label = get_node("Label")

var paused: = false setget set_paused

func _ready() -> void:
	PlayerData.connect("score_updated", self, "update_inderface")
	PlayerData.connect("days_updated", self, "_PlayerData_player_days")
	update_interface()
	

	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

func update_interface() -> void:
	days.text = "Days: %s" % PlayerData.daysSurvived

func set_paused(value: bool) -> void:
	print(value)
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
