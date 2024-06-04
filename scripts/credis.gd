extends Camera2D

@export var credit_end : int
@export var speed : float = 0.1
@export var label : Label
var credis_text = "



PROJECT: SL0P ZER0 BOUNDLE55








videos game
















Modelling: pYMxolbo

Level Design: pYMxolbo

Sound Design: pYMxolbo

Coding: pYMxolbo, Random Online Tutorials I Didn't Save

UI Design: pYMxolbo

Shader Design: pYMxolbo

Grappling Hook And The Face On The Edge Ff The Health Bar Doing That: Godot Plugins

Basically Everything That Isn't A Funny Image Or Taken From Somewhere Else: pYMxolbo

Big Insparations: Cruelty Squad, Ipad Baby, Juice Galaxy, Ultrakill

Music That It Said Was Free So I Used:

https://www.youtube.com/watch?v=GRTvDLOC1_w chosen (level 1 map 2)
https://www.youtube.com/watch?v=G98TIREqIvA apologize
https://www.youtube.com/watch?v=JWlVkPYciQM path
https://www.youtube.com/watch?v=BAx1iAYKexI not you too
https://www.youtube.com/watch?v=zEaM7rrhyjQ red (level 1 map 4)
https://www.youtube.com/watch?v=L7lbXIkUfoM shotta
https://www.youtube.com/watch?v=L4bq-U14xWg feelings die (alpha level, level 1 map 1)
https://www.youtube.com/watch?v=UqqS7axJg4E waybackwhen
https://www.youtube.com/watch?v=FEs79iwkeCc bright
https://www.youtube.com/watch?v=kVwZ8yz-Csc reborn
https://www.youtube.com/watch?v=9Ppn-c8ztHU beauty and a beat (level 1 map 3)
https://www.youtube.com/watch?v=NkK5oc0y5q8 romance garbage (credits)
https://www.youtube.com/watch?v=qc_tAuAYDY4 from time
https://www.youtube.com/watch?v=LAeJvtZw7eo wavez (pause menu, test room)
https://www.youtube.com/watch?v=CboeCdA2BA8 everlasting (start menu)
https://www.youtube.com/watch?v=CsxfSYZ0i6s chosen

The Maker of Music: https://www.youtube.com/@prodkbeatz


your cool too :)


End Of Credits
"



func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	label.text = credis_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position.y += speed
	if position.y > credit_end:
		get_tree().change_scene_to_file("res://scenes/titlescreen.tscn")
