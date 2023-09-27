extends CharacterBody2D

signal tookDamage

var force = 500
var _screenSize
var rocketScene = preload("res://scenes/rocket.tscn")
@onready var rocketContainer = $RocketContainer
@onready var shootSound = $ShootSound

	
func _process(_delta):
	if Input.is_action_just_pressed("Shoot"):
		shoot()

func _physics_process(_delta):
	velocity = Vector2(0, 0)
	_screenSize = get_viewport_rect().size
	if Input.is_anything_pressed():
		velocity = Vector2(Input.get_axis("Left","Right") * force, Input.get_axis("Up", "Down") * force)
	
	global_position = global_position.clamp(Vector2(0, 0), _screenSize)
	
	move_and_slide()

func shoot():
	var rocketInstance = rocketScene.instantiate()
	rocketContainer.add_child(rocketInstance)
	rocketInstance.global_position = global_position
	rocketInstance.global_position.x += 50
	shootSound.play()
	
func takeDamage():
	tookDamage.emit()
	
func die():
	queue_free()
