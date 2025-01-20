extends Area2D
@onready var player = $"../../Player"
var active = false


func _physics_process(delta):
	if player.spawn == self.position:
		$AnimationPlayer.play("active")	
	else:
		$AnimationPlayer.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		player.spawn = self.position
		
