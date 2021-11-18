extends Position2D

var max_rotate_speed = 5
var rotate_speed = 0.5
var collided = false

func _process(delta):
	if !collided:
		rotate(-rotate_speed*delta)
		if (rotate_speed * delta) < (max_rotate_speed * delta):
			rotate_speed += 0.5
	else:
		rotate_speed = 0.5
		rotate(0)
