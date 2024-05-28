extends CharacterBody3D

@export var maxdj = 3
var dj = 0
const SPEED = 8
const JUMP_VELOCITY = 2.5#6
var momentum : float = 0.0
var  maxspeed : float = 5
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

@onready var normalcol := $normal
@onready var shortcol := $short

@onready var healthbar := $overlay/healthbar
@export var max_hp : int = 10



@onready var jumpsound := $jump
@onready var walksound := $walk
@onready var runsound := $fast
@onready var taboutsound := $tab
@onready var diesound := $death
@onready var stabsound := $stab
@onready var hurtsound := $ouch
@onready var winsound := $win
@onready var slidesound := $slide
@onready var slamsound := $gslam
@onready var sboostsound := $slideboost
@onready var flashsound := $flashtoggle

@onready var circle := $Neck/Camera3D/Jumpback/circle
@onready var triangle := $Neck/Camera3D/Jumpback/triangle
@onready var donut := $Neck/Camera3D/Jumpback/donut
@export var circleglow : Material
@export var triangleglow : Material
@export var donutglow : Material
@export var noglow : Material


var hp : float = 1

var zbonus : float = 0
var ybonus : float = 0

var slide : bool = false

func _ready():
	hp = max_hp
	healthbar.max_value = max_hp

func _unhandled_input(event: InputEvent) -> void:	
	if event is InputEventMouseButton or event.is_action_released("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		face.play("business")
	elif event.is_action_pressed("tab"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		face.play("yokai")
		taboutsound.play()
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * mouse_sense)
			camera.rotate_x(-event.relative.y * mouse_sense)
			camera.rotation.x =  clampf(camera.rotation.x, deg_to_rad(-60), deg_to_rad(75))

func _input(event):
	var temp_maxspeed : int
	if Input.get_vector("left", "right", "up", "down") != Vector2.ZERO and is_on_floor():
		momentum = clamp(momentum + 0.05, 0, maxspeed)
		face.play("he")
	if event.is_action_pressed("light"):
		light.visible = not light.visible
		face.play("sog")
		flashsound.play()
	if event.is_action_pressed("attack"):
		face.play("man")
		hammer.position = Vector2(-50, 50)
		hambox.disabled = false
		stabsound.play()
		#hammer.get_parent().progress_ratio = 0
	if event.is_action_released("attack"):
		hammer.position = Vector2.ZERO
		hambox.disabled = true
	
	if event.is_action_pressed("slide"):
		if is_on_floor():
			maxspeed *= 2
			neck.position.y = 0
			slide = true
			slidesound.play()
			normalcol.disabled = true
			shortcol.disabled = false
		else:
			ybonus = 50
			slamsound.play()
	if event.is_action_released("slide") and slide == true:
		neck.position.y = 0.6
		#momentum /= 2
		maxspeed /= 2
		zbonus = -100
		sboostsound.play()
		#print(str(maxspeed) + " = maxspeed")
		slide = false
		normalcol.disabled = false
		shortcol.disabled = true
	if event.is_action_pressed("shoot"):
		face.play("malt")
	if event.is_action_pressed("reload"):
		face.play("john")

		
func _process(delta):
	#jumpbar.value = dj
	healthbar.max_value = max_hp
	healthbar.value = hp
	if Input.get_vector("left", "right", "up", "down") == Vector2.ZERO:
		momentum = move_toward(momentum, 0, delta)		
	speedmeter.value = momentum
	if is_on_floor() == true:
		dj = maxdj
		jumpmeter()
	if momentum > 0 and Input.get_vector("left", "right", "up", "down") != Vector2.ZERO:
		hammer.bob(0.05)
		movesound()
	else:
		hammer.get_parent().progress_ratio = 0
	if hp <= 0:
		diesound.play()
		get_tree().quit()
		
	

func movesound():
	if momentum > 0 and momentum < maxspeed / 2:
		walksound.play()
	elif momentum > maxspeed / 2:
		runsound.play()










func _physics_process(delta):	
	
	if not is_on_floor():
		velocity.y -= (gravity * delta)
	
	velocity.y -= ybonus
	
	if Input.is_action_just_pressed("space") and dj > 0:
		velocity.y = clamp((JUMP_VELOCITY * momentum), 0, maxspeed * 1.5)
		dj -= 1
		momentum -= momentum / 10
		jumpmeter()
		face.play("mindblow")
		jumpsound.play()
	
	
	
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * (SPEED * momentum)
		velocity.z = direction.z * (SPEED * momentum) + zbonus
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED / 5)
		velocity.z = move_toward(velocity.z, 0, SPEED / 5)

	ybonus = 0
	zbonus = 0
	move_and_slide()


func _on_attackbox_body_entered(body):
	if body.is_in_group("enemies"):
		body.health -= damage
		face.play("rage")

func _hurt():
	face.play("beastmode")
	momentum -= 1
	hurtsound.play()



func jumpmeter():
	if dj > 0:
		donut.material_override = donutglow
	else:
		donut.material_override = noglow
	if dj > 1:
		triangle.material_override = triangleglow
	else:
		triangle.material_override = noglow
	if dj > 2:
		circle.material_override = circleglow
	else:
		circle.material_override = noglow