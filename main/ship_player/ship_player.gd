extends CharacterBody2D


const SPEED = 300.0
const TURBO_SPEED = 600.0
const JUMP_VELOCITY = -400.0

var current_speed = SPEED


func _init():
	print(ProjectSettings.get_setting("physics/2d/default_gravity"))


func _physics_process(delta):

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var aceleration = Input.get_axis("ui_left", "ui_right")
	if aceleration > 0:
		current_speed = TURBO_SPEED
	else:
		current_speed = SPEED
	velocity.x = aceleration * current_speed
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(0, 0, SPEED)

	move_and_slide()
