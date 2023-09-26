extends Area2D

@export var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	global_position.x -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	die()
	
func die():
	queue_free()


func _on_body_entered(body):
	body.takeDamage()
	die()
