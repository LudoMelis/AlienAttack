extends CharacterBody2D

var force = 500

func _physics_process(_delta):
	velocity = Vector2(0, 0)
	if Input.is_anything_pressed():
		print("x : " + str(Input.get_axis("Left", "Right")) + " - y : " + str(Input.get_axis("Up", "Down")))
		velocity = Vector2(Input.get_axis("Left","Right") * force, Input.get_axis("Up", "Down") * force)
	move_and_slide()
