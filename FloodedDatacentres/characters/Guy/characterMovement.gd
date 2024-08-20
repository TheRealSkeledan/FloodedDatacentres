extends CharacterBody2D


const SPEED = 60.0
const JUMP_VELOCITY = -200.0

@onready var sprite: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var handheldAnimation: AnimationPlayer = $handheldAnimation


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		sprite.get_parent().flip_h = false
	elif direction < 0:
		sprite.get_parent().flip_h = true

	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, 15)
		if abs(velocity.x) < 5:
			sprite.play("idli")
			handheldAnimation.play("idli")
	else:
		if Input.is_action_pressed("shift"):
			sprite.play("walk", 2)
			velocity.x = direction * SPEED * 2
		else:
			sprite.play("walk", 0, 1)
			handheldAnimation.play("walk")
			velocity.x = direction * SPEED

	move_and_slide()
