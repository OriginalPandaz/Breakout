extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var started = false
var ball_x_pos = 460.5
var ball_y_pos = 470.5

# Called when the node enters the scene tree for the first time.
#func _ready():

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_select") and started == false:
		randomize()
		velocity.x = [-1,1][randi() % 2] * 250
		velocity.y = 400
		started = true
		
	var collided = move_and_collide(velocity * delta)
	if collided:
		velocity = velocity.bounce(collided.normal);
		if collided.collider.name.begins_with("Brick"):
			collided.collider.free()
		elif collided.collider.name.begins_with("Void"):
			velocity = Vector2.ZERO
			started = false
			position = Vector2(ball_x_pos,ball_y_pos)
			$"../Paddle".position = Vector2(496,544)
