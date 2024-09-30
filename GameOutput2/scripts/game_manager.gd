extends Node
@onready var score_label = $"../UI/MarginContainer/ScoreLabel"
var score = 0


func add_point():
	score += 1
	score_label.text = "oranges: " + str(score)
	
