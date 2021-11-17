extends Position2D

var rotate_speed = 10

func _process(delta):
	rotate(-rotate_speed*delta)
