extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var JUMP_COUNTER = 0
var spawn = Vector2(5,0)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if Input.is_action_just_pressed("JumpMovement") and JUMP_COUNTER < 1:
			velocity.y = JUMP_VELOCITY
			JUMP_COUNTER += 1
		

	if Input.is_action_just_pressed("JumpMovement") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		JUMP_COUNTER += 1


	var direction = Input.get_axis("LeftMovement", "RightMovement")
	
	# To flip sprite based on direction
	if direction == 1:
		animated_sprite_2d.set_flip_h(1)
	elif direction == -1:
		animated_sprite_2d.set_flip_h(0)
	
	# Animation	
	if is_on_floor():
		JUMP_COUNTER = 0
		if direction == 0:
			animated_sprite_2d.play("idle")
		elif Input.is_action_pressed("RunEnable"):
			animated_sprite_2d.play("run_fast")
		else:
			animated_sprite_2d.play("run")

	else:
		if velocity.y <= 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")
	
	# Movement
	if direction:
		if Input.is_action_pressed("RunEnable"):
			velocity.x = direction * SPEED * 1.5

		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func death():
	position = spawn
