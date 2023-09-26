extends Node2D

var lives = 3
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_took_damage():
	print("signal received")
	lives -= 1
	if lives == 0:
		print("game over")
		player.die()
		
	print("lifes left : " + str(lives))
