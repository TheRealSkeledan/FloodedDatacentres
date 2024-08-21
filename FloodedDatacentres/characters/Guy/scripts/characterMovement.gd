extends CharacterBody2D

const SPEED = 60.0
const JUMP_VELOCITY = -200.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var spriteAnimation: AnimationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var handheldAnimation: AnimationPlayer = $handheld/handheldAnimation
@onready var handheld: Sprite2D = $handheld


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")
	
	if direction == 0:
		velocity.x = move_toward(velocity.x, 0, 15)
		if abs(velocity.x) < 5:
			spriteAnimation.play("idli")
			if sprite.flip_h:
				handheldAnimation.play("idliLeft")
			else:
				handheldAnimation.play("idliRight")
	elif direction > 0:
		sprite.flip_h = false
		if Input.is_action_pressed("shift"):
			spriteAnimation.play("walk", 0, 2)
			handheldAnimation.play("right", 0, 2)
			velocity.x = direction * SPEED * 2
		else:
			spriteAnimation.play("walk", 0, 1)
			handheldAnimation.play("right", 0, 1)
			velocity.x = direction * SPEED
	else:
		sprite.flip_h = true
		if Input.is_action_pressed("shift"):
			spriteAnimation.play("walk", 0, 2)
			handheldAnimation.play("left", 0, 2)
			velocity.x = direction * SPEED * 2
		else:
			spriteAnimation.play("walk", 0, 1)
			handheldAnimation.play("left", 0, 1)
			velocity.x = direction * SPEED
	move_and_slide()
	
