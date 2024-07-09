extends Node

@export var level_1_FPath : String
@export var credits_path : String

#@export var fullscreenguy : CheckBox

@export var secret_menu : Control

@export var small : CheckButton
@export var big : CheckButton
@export var galss : CheckButton
@export var hyper : CheckButton


# Called when the node enters the scene tree for the first time.

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	small.button_pressed = GameMode.small
	big.button_pressed = GameMode.big
	galss.button_pressed = GameMode.glass
	hyper.button_pressed = GameMode.hyper

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("reload"):
		if Input.is_action_pressed("left"):
			if Input.is_action_pressed("content"):
				if Input.is_action_pressed("grapple"):
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


func _on_check_box_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
