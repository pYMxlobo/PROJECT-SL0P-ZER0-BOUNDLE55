extends Node

@export var level_1_FPath : String
@export var credits_path : String



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	get_tree().change_scene_to_file(level_1_FPath)



func _on_exit_pressed():
	get_tree().quit()



func _on_credits_pressed():
	get_tree().change_scene_to_file(credits_path)
