extends Node2D

@export var spin : bool
@export var speed : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spin == true:
		rotate(speed)
