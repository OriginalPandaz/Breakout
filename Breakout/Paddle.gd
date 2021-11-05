extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var x_speed = 450
var movement = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		movement.x = x_speed
	elif Input.is_action_pressed("ui_left"):
		movement.x = -x_speed
	else:
		movement.x = 0
	move_and_slide(movement)
	
