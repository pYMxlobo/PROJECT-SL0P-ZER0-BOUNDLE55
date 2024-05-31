extends Node

@export var level_1_FPath : String
@export var credits_path : String

@export var secret_menu : Control

@export var small : CheckButton
@export var big : CheckButton
@export var galss : CheckButton
@export var hyper : CheckButton

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("grapple"):
		if Input.is_action_pressed("content"):
			if Input.is_action_pressed("interact"):
				if Input.is_action_pressed("reload"):
					secret_menu.show()


func _on_start_pressed():
	get_tree().change_scene_to_file(level_1_FPath)



func _on_exit_pressed():
	get_tree().quit()



func _on_credits_pressed():
	get_tree().change_scene_to_file(credits_path)


func _on_small_pressed():
	big.button_pressed = false
	GameMode.small = not GameMode.small

func _on_big_pressed():
	small.button_pressed = false
	GameMode.big = not GameMode.big


func _on_glass_pressed():
	GameMode.glass = not GameMode.glass


func _on_hyper_pressed():
	GameMode.hyper = not GameMode.hyper
