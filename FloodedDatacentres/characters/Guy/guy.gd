extends Node2D

@export var interacting: bool

#signal interact(node: Node)
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		interacting = true
	else:
		interacting = false
