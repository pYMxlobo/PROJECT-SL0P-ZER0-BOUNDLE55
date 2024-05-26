extends CharacterBody3D

@export var maxdj = 3
var dj = 0
const SPEED = 8
const JUMP_VELOCITY = 6
var momentum : float = 0.0
const  maxspeed : int = 5
@export var mouse_sense : float = 0.001
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") #its 6.3
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var speedmeter := $Neck/Camera3D/ProgressBar
@onready var light := $Neck/Camera3D/MeshInstance3D2/SpotLight3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton or event.is_action_released("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * mouse_sense)
			camera.rotate_x(-event.relative.y * mouse_sense)
			camera.rotation.x =  clampf(camera.rotation.x, deg_to_rad(-60), deg_to_rad(75))

func _input(event):
	if Input.get_vector("left", "right", "up", "down") != Vector2.ZERO and is_on_floor():
		momentum = clamp(momentum + 0.05, 0, maxspeed)
	if event.is_action_pressed("light"):
		light.visible = not light.visible

func _process(delta):
	if Input.get_vector("left", "right", "up", "down") == Vector2.ZERO:
		momentum = move_toward(momentum, 0, delta)
	speedmeter.value = momentum
	if is_on_floor() == true:
		dj = maxdj

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	
	if Input.is_action_just_pressed("space") and dj > 0:
		velocity.y = JUMP_VELOCITY
		dj -= 1
		momentum -= momentum / 10

	
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * (SPEED * momentum)
		velocity.z = direction.z * (SPEED * momentum)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / 5)
		velocity.z = move_toward(velocity.z, 0, SPEED / 5)
		

	move_and_slide()
