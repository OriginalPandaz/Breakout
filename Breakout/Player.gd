extends KinematicBody2D

var SPEED = 250
var movement = Vector2(0,0)
var victory = false

func _process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		movement.x = 0
	elif Input.is_action_pressed("ui_right"):
		movement.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		movement.x = -SPEED
	else:
		movement.x = lerp(movement.x,0,0.2)
	
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		movement.y = 0
	elif Input.is_action_pressed("ui_up"):
		movement.y = -SPEED
	elif Input.is_action_pressed("ui_down"):
		movement.y = SPEED
	else:
		movement.y = lerp(movement.y,0,0.2)
	
	var collided = move_and_collide(movement * delta)
	if collided:
		if collided.collider.name.begins_with("Edge"):
			victory = true
	
	move_and_slide(movement)
