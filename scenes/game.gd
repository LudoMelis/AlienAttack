extends Node2D

var lives = 3
var score = 0


@onready var player = $Player
@onready var hud = $UI/HUD

# Called when the node enters the scene tree for the first time.
func _ready():
	hud.setScoreLabel(score)
	hud.setLifeLabel(lives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		print("game over")
		player.die()
	hud.setLifeLabel(lives)


func _on_enemy_spawner_enemy_spawned(enemyInstance):
	enemyInstance.connect("died", onEnemyDied)
	add_child(enemyInstance)

func onEnemyDied():
	score += 100
	hud.setScoreLabel(score)

