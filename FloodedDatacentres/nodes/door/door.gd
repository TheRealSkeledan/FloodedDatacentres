extends Node

var bodies: Array = []
var connection: Node

@export var resource: door

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connection = get_node(resource.connection)
	
	
func setVWalk(person: Node) -> void:
	#var room: Node = connection.get_parent()
	#person.room = room;
	#person.verticalWalk = room.getVWalk()
	print(person.resource.room)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for body in bodies:
		if body.get_parent().resource.interacting:
			body.global_position = connection.global_position
			setVWalk(body.get_parent())



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies.append(body)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		bodies.erase(body)
