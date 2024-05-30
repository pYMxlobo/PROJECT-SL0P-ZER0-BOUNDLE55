extends PathFollow3D

@export var speed = 0.001

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	progress_ratio += speed
