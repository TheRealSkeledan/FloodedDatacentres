extends Sprite2D

var speed = 100
@onready var animation = $AnimationPlayer

func _process(delta):
	if Input.is_action_pressed("ui_right") or Input.is_key_pressed(KEY_D):
		flip_h = false
		animation.play("run")
		position.x += speed * delta
		
	if Input.is_action_pressed("ui_left") or Input.is_key_pressed(KEY_A):
		flip_h = true
		frame_coords.x -= 2
		animation.play("run")
		position.x -= speed * delta
		
	if Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W):
		animation.play("run")
		position.y -= speed * delta
		
	if Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_S):
		animation.play("run")
		position.y += speed * delta
		
	if Input.is_key_pressed(KEY_SPACE):
		animation.play("attack")
		
	animation.play("idle")
