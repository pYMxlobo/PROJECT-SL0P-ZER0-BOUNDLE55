extends Area3D

@export var Char_Name : String
@export var Dialogue : String
@export var Face : Texture
@export var disabler : bool	
@export var disableorigin : Area3D
var activated : bool = false

func _on_body_entered(body):
	if activated == false:
		if body.is_in_group("freak"):
			if disabler == false:
				body.textbox.show()
				body.texttext.text = Dialogue
				body.textface.texture = Face
				body.textname.text = Char_Name
				activated = true
			else:
				if disableorigin.activated == true:
					body.textbox.hide()
			monitorable = false
			monitoring = false
			
