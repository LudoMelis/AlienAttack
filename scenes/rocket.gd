extends Area2D

@export var speed = 500

#@onready var visibleNotifier = $VisibleNotifier

func _ready():
	pass
	#visibleNotifier.connect("screen_exited", _onScreenExited)

func _physics_process(delta):
	global_position.x += speed*delta


func _on_visible_notifier_screen_exited():
	queue_free()
