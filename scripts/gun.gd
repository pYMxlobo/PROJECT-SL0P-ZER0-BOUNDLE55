extends Sprite3D

var ammo : int = 17
var maxammo : int = 17
@onready var ray := $aimspot/shot
@onready var flare := $aimspot/flare
@onready var shot := $fire
@onready var reload := $reload
@onready var cooldown := $reloadcooldown
@onready var shootfail := $shootfail
@onready var ammotext := $ammo
var reloadreload = false


func _input(event):	
	if event.is_action_pressed("shoot"):
		if ammo > 0:
			flare.show()
			shot.play()
			ammo -= 1
			if ray.get_collider() != null:
				if ray.get_collider().is_in_group("enemies"):
					ray.get_collider().health -= 1
					ray.get_collider().hurtsound.play()
					#print(ray.get_collider())
		else:
			shootfail.play()
	if event.is_action_released("shoot"):
		flare.hide()
	if event.is_action_pressed("reload"):
		if reloadreload == false:
			reload.play()
	ammotext.mesh.text = str(ammo) + " / " + str(maxammo)

func _on_reload_finished():
	ammo = maxammo
	reloadreload = true
	cooldown.play()


func _on_reloadcooldown_finished():
	reloadreload = false
