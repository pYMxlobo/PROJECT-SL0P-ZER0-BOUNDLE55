extends CharacterBody3D

@export var maxdj = 3
var dj = 0
const SPEED = 8
const JUMP_VELOCITY = 2.5#6
var momentum : float = 0.0
const  maxspeed : int = 5
@export var mouse_sense : float = 0.001
@export var damage = 1
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") #its 6.3
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var speedmeter := $overlay/ProgressBar
@onready var light := $Neck/Camera3D/MeshInstance3D2/SpotLight3D
@onready var hammer := $overlay/Path2D/PathFollow2D/knife
@onready var hambox := $Neck/attackbox/CollisionShape3D
@onready var face := $overlay/hi/car
@onready var jumpbar := $overlay/jumpbar
@export var max_hp : int = 10
var hp : int = 1

func _ready():
	hp = max_hp

func _unhandled_input(event: InputEvent) -> void:	
	if event is InputEventMouseButton or event.is_action_released("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		face.play("business")
	elif event.is_action_pressed("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		face.play("yokai")
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * mouse_sense)
			camera.rotate_x(-event.relative.y * mouse_sense)
			camera.rotation.x =  clampf(camera.rotation.x, deg_to_rad(-60), deg_to_rad(75))

func _input(event):		
	if Input.get_vector("left", "right", "up", "down") != Vector2.ZERO and is_on_floor():
		momentum = clamp(momentum + 0.05, 0, maxspeed)
		face.play("he")
	if event.is_action_pressed("light"):
		light.visible = not light.visible
	if event.is_action_pressed("attack"):
		hammer.position = Vector2(-50, 50)
		hambox.disabled = false
		#hammer.get_parent().progress_ratio = 0
	if event.is_action_released("attack"):
		hammer.position = Vector2.ZERO
		hambox.disabled = true
func _process(delta):
	jumpbar.value = dj
	if Input.get_vector("left", "right", "up", "down") == Vector2.ZERO:
		momentum = move_toward(momentum, 0, delta)
	speedmeter.value = momentum
	if is_on_floor() == true:
		dj = maxdj
	if momentum > 0 and Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		hammer.bob(0.05)
	else:
		hammer.get_parent().progress_ratio = 0
	if hp <= 0:
		get_tree().quit()




func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	
	
	if Input.is_action_just_pressed("space") and dj > 0:
		velocity.y = clamp((JUMP_VELOCITY * momentum), 0, maxspeed * 1.5)
		dj -= 1
		momentum -= momentum / 10
		face.play("mindblow")
	
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * (SPEED * momentum)
		velocity.z = direction.z * (SPEED * momentum)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / 5)
		velocity.z = move_toward(velocity.z, 0, SPEED / 5)
		

	move_and_slide()


func _on_attackbox_body_entered(body):
	if body.is_in_group("enemies"):
		body.health -= damage
		face.play("rage")

func _hurt():
	face.play("beastmode")
