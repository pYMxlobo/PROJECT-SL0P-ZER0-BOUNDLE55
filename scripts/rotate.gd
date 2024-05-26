extends Node3D

@export_enum("x", "y", "z", "xy", "xz", "yz", "xyz") var spin : int
@export var speed : float

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if spin == 0:
		rotate_x(speed)
	if spin == 1:
		rotate_y(speed)
	if spin == 2:
		rotate_z(speed)
	if spin == 3:
		rotate_x(speed)
		rotate_y(speed)
	if spin == 4:
		rotate_x(speed)
		rotate_z(speed)
	if spin == 5:
		rotate_y(speed)
		rotate_z(speed)
	if spin == 6:
		rotate_x(speed)
		rotate_y(speed)
		rotate_z(speed)
