extends Node3D

@export var wrong : AudioStreamPlayer


@export var sigma1 : Sprite2D
@export var sigma2 : Sprite2D
@export var sigma3 : Sprite2D
@export var sigma4 : Sprite2D
@export var sigma5 : Sprite2D
@export var sigma6 : Sprite2D
@export var sigma7 : Sprite2D
@export var sigma8 : Sprite2D
@export var sigma9 : Sprite2D
@export var sigma10 : Sprite2D

@export var button1 : Button
@export var button2 : Button
@export var button3 : Button
@export var button4 : Button
@export var button5 : Button
@export var button6 : Button
@export var button7 : Button
@export var button8 : Button
@export var button9 : Button
@export var button10 : Button






func _ready():
	match Level.level:
		0:
			sigma1.modulate = Color.WHITE
		1:
			sigma2.modulate = Color.WHITE
		2:
			sigma3.modulate = Color.WHITE
		3:
			sigma4.modulate = Color.WHITE
		4:
			sigma5.modulate = Color.WHITE
		5:
			sigma6.modulate = Color.WHITE
		6:
			sigma7.modulate = Color.WHITE
		7:
			sigma8.modulate = Color.WHITE
		8:
			sigma9.modulate = Color.WHITE
		9:
			sigma10.modulate = Color.WHITE
	if Level.level >= 0:
		button1.disabled == false
	else:
		button1.disabled == true
	if Level.level >= 1:
		button2.disabled == false
	else:
		button2.disabled == true
	if Level.level >= 2:
		button3.disabled == false
	else:
		button3.disabled == true
	if Level.level >= 3:
		button4.disabled == false
	else:
		button4.disabled == true
	if Level.level >= 4:
		button5.disabled == false
	else:
		button5.disabled == true
	if Level.level >= 5:
		button6.disabled == false
	else:
		button6.disabled == true
	if Level.level >= 6:
		button7.disabled == false
	else:
		button7.disabled == true
	if Level.level >= 7:
		button8.disabled == false
	else:
		button8.disabled == true
	if Level.level >= 8:
		button9.disabled == false
	else:
		button9.disabled == true
	if Level.level >= 9:
		button10.disabled == false
	else:
		button10.disabled == true










func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level1map1.tscn")


func _on_level_2_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level2map1.tscn")


func _on_level_3_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level3map1.tscn")


func _on_level_4_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level4map1.tscn")


func _on_level_5_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level5map1.tscn")


func _on_level_6_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level6map1.tscn")


func _on_level_7_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level7map1.tscn")


func _on_level_8_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level8map1.tscn")


func _on_level_9_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level9map1.tscn")


func _on_level_10_pressed():
	wrong.play()
	#get_tree().change_scene_to_file("res://scenes/level10map1.tscn")
