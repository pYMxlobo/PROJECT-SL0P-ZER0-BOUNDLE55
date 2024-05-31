extends Camera2D

@export var credit_end : int
@export var speed : float = 0.1
@export var label : Label
@export var credis : String
var credis_text : String



func _ready():
	var kino = FileAccess.open("res://credits.txt", FileAccess.READ)
	credis_text = kino.get_pascal_string()
	kino.close()
	label.text = credis_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += speed
	if position.y > credit_end:
		get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
