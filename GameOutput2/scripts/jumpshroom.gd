extends Area2D
@onready var player = $"../../Player"
var active = false


func _physics_process(delta):
	if !active:
		$AnimationPlayer.play("idle")
	else:
		$AnimationPlayer.play("active")
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		if player.velocity.y > 0:
			player.velocity.y = 0
			player.velocity.y -= 500
			if active:
				active = false
			else:
				active = true

