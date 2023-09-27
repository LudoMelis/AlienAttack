extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.find_next_valid_focus().grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func setScore(newScore):
	$Panel/Score.text = "SCORE : " + str(newScore)


func _on_retry_button_pressed():
	get_tree().reload_current_scene()
