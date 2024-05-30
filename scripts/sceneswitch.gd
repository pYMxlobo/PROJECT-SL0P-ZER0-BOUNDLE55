extends Area3D

@export var scene_name : String
var next : String

var enabled : bool = false



func _ready():
	next = "res://scenes/" + scene_name + ".tscn"	


func _on_body_entered(body):
	if body.is_in_group("freak"):
		enabled = true
		body.interactavail = true


func _on_body_exited(body):
	if body.is_in_group("freak"):
		enabled = false
		body.interactavail = false

func _input(event):
	if enabled == true:
		if event.is_action_pressed("interact"):
			get_tree().change_scene_to_file(next)
