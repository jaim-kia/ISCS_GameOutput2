extends Area2D
@onready var player = $"../../Player"
var active = false


func _on_body_entered(body):
	if body.is_in_group("player"):
		player.death()
