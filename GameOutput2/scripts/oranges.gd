extends Area2D
@onready var game_manager = %GameManager
@onready var animation_pickup = $AnimationPickup


func _on_body_entered(body):
	game_manager.add_point()
	animation_pickup.play("pickup_coin")
