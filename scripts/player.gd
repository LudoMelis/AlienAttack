extends CharacterBody2D

var force = 500
var _screenSize

func _ready():
	pass

func _physics_process(_delta):
	velocity = Vector2(0, 0)
	_screenSize = get_viewport_rect().size
	if Input.is_anything_pressed():
		velocity = Vector2(Input.get_axis("Left","Right") * force, Input.get_axis("Up", "Down") * force)
	move_and_slide()
	
	global_position = global_position.clamp(Vector2(0, 0), _screenSize)
