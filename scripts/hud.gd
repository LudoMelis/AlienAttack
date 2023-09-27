extends Control


@onready var scoreLabel = $Score
@onready var lifeLabel = $Life

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setScoreLabel(newScore):
	scoreLabel.text = "SCORE : " + str(newScore)
	
func setLifeLabel(newLife):
	lifeLabel.text = "X " + str(newLife)
