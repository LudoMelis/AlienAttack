extends Node2D

signal enemySpawned(enemyInstance)
signal pathEnemySpawned(pathEnemyInstance)

@onready var enemyScene = preload("res://scenes/enemy.tscn")
@onready var pathEnemyScene = preload("res://scenes/path_enemy.tscn")
@onready var spawnPositions = $SpawnPositions

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawnEnemy()
	
func spawnEnemy():
	var spawnPositionsArray = spawnPositions.get_children()
	var randomSpawnPosition = spawnPositionsArray.pick_random()
	var enemyInstance = enemyScene.instantiate()
	enemyInstance.global_position = randomSpawnPosition.global_position
	enemySpawned.emit(enemyInstance)
#	add_child(enemyInstance)


func _on_path_timer_timeout():
	var rng = RandomNumberGenerator.new()
	if rng.randi_range(0, 1) < 1:
		spawnPathEnemy()

func spawnPathEnemy():
	var pathEnemyInstance = pathEnemyScene.instantiate()
	pathEnemySpawned.emit(pathEnemyInstance)
