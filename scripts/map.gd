extends Node3D

@onready var freak = $Freak
@export var EnemyDeathWin : bool = false
@export var EDWNext : String


func _physics_process(_delta):
	get_tree().call_group("enemies", "update_rizzler_loc", freak.global_transform.origin)




func _process(delta):
	if EnemyDeathWin == true:
		if get_tree().get_nodes_in_group("enemies").is_empty():
			get_tree().change_scene_to_file("res://scenes/" + EDWNext + ".tscn")
