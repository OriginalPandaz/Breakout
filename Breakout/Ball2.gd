extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2.ZERO
var started = false
var ball_x_pos = 460.5
var ball_y_pos = 470.5
var totalHits = 84
var counter = 0
var score = 0
var lives = 3
var canDestroyBrick = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$"BallImage2".hide()
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
			$Hit.play()
			$"../ScoreLabel".text = "Score: " + str(score)
			if canDestroyBrick:
				var tile = $"../Bricks".world_to_map(collided.position)
				$"../Bricks".set_cell(tile.x,tile.y,-1)
				counter += 1
				canDestroyBrick = false
				$"BallImage2".hide()
				score += randi() % 500
		elif collided.collider.name.begins_with("Void"):
			$Void.play()
			if lives == 3:
				$"../LivesLabel/Life3".visible = false
			elif lives == 2:
				$"../LivesLabel/Life2".visible = false
			else:
				$"../LivesLabel/Life1".visible = false
			lives -= 1
			velocity = Vector2.ZERO
			started = false
			position = Vector2(ball_x_pos,ball_y_pos)
			$"../Player".position = Vector2(496,544)
		elif collided.collider.name.begins_with("Paddle2"):
			$"../Player".movement.y = 0
			canDestroyBrick = true
			$"BallImage2".show()
		elif collided.collider.name.begins_with("Player"):
			$Void.play()
			if lives == 3:
				$"../LivesLabel/Life3".visible = false
			elif lives == 2:
				$"../LivesLabel/Life2".visible = false
			else:
				$"../LivesLabel/Life1".visible = false
			lives -= 1
		if counter == totalHits:
			velocity = Vector2.ZERO
