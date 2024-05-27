extends CharacterBody3D

signal did_attack

@onready var nav_agent = $NavigationAgent3D
@export var health = 10
@export var SPEED = 3.0
@export var weight = .5
var freaker

func _ready():
	await get_parent().ready

func _physics_process(delta):
	var current_loc = global_transform.origin
	var next_loc = nav_agent.get_next_path_position()
	var new_veloc = (next_loc - current_loc).normalized() * SPEED
	nav_agent.set_velocity(new_veloc)
	freaker.y = current_loc.y
	$facepivot.look_at(freaker, Vector3.UP)
	

func update_rizzler_loc(targ_loc):
	nav_agent.target_position = targ_loc
	freaker = targ_loc

func _process(delta):
	if health <= 0:
		queue_free()


func _on_navigation_agent_3d_velocity_computed(safe_velocity):
	velocity = velocity.move_toward(safe_velocity, weight)
	move_and_slide()


func _on_attack_body_entered(body):
	print("detect success")
	if body.is_in_group("freak"):
		did_attack.connect(body._hurt)
		body.hp -= 1	
		$facepivot/attack/attackbox.disabled = true
		$attackcooldown.start()
		print("attack!!!")
		did_attack.emit()

func _on_attackcooldown_timeout():
	$facepivot/attack/attackbox.disabled = false
	print("can attack")
