extends Node3D

@onready var freak = $Freak


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	get_tree().call_group("enemies", "update_rizzler_loc", freak.global_transform.origin)
