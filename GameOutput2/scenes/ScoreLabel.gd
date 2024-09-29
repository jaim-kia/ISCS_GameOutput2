extends Label

@onready var player = get_node("/root/Game/Player")
@onready var score_label = get_node("/root/Game/GameManager/ScoreLabel")

func _process(delta):
	if player == null:
		print("player not found!")
		return
	
	var offset = Vector2(60, -70)

	score_label.position = player.position + offset
