extends Node3D

@onready var freak = $Freak


func _physics_process(_delta):
	get_tree().call_group("enemies", "update_rizzler_loc", freak.global_transform.origin)
	
