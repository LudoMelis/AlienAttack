extends Node2D

var lives = 3
var score = 0
var stage = 1

var gameOverScene = preload("res://scenes/game_over_screen.tscn")

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemyHitSound = $EnemyHitSound
@onready var playerExplodesSound = $PlayerExplodesSound

# Called when the node enters the scene tree for the first time.
func _ready():
	hud.setScoreLabel(score)
	hud.setLifeLabel(lives)
	stage = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_took_damage():
	lives -= 1
	if lives == 0:
		player.die()
		playerExplodesSound.play()
		getGameOverScene()
	hud.setLifeLabel(lives)


func _on_enemy_spawner_enemy_spawned(enemyInstance):
	enemyInstance.connect("died", onEnemyDied)
	add_child(enemyInstance)
	enemyInstance.speed = enemyInstance.speed * stage

func onEnemyDied():
	score += stage * 100
	hud.setScoreLabel(score)
	enemyHitSound.play()
	
	
func getGameOverScene():
	$StageTimer.stop()
	await get_tree().create_timer(3).timeout
	var gameOverInstance = gameOverScene.instantiate()
	gameOverInstance.setScore(score)
	ui.add_child(gameOverInstance)
	
func _on_enemy_spawner_path_enemy_spawned(pathEnemyInstance):
	add_child(pathEnemyInstance)
	pathEnemyInstance.enemy.connect("died", onEnemyDied)


func _on_stage_timer_timeout():
	stage += 1
	hud.setStageLabel(stage)
