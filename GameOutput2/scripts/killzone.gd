extends Area2D
@onready var player = $"../Player"
@onready var timer = $Timer


func _on_body_entered(body):
	timer.start()
	
func _on_timer_timeout():
	player.death()
