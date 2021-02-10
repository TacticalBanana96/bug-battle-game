extends Node

signal score_updated
signal day_survived

var score: = 0 setget set_score, get_score
var daysSurvived: = 0 setget set_days, get_days

func reset() -> void:
	score = 0
	daysSurvived = 0

func set_score(value: int) -> void:
	score = value
	emit_signal("score_updated")

func get_score() -> int:
	return score

func set_days(value: int) -> void:
	daysSurvived = value
	emit_signal("days_updated")

func get_days() -> int:
	return daysSurvived
