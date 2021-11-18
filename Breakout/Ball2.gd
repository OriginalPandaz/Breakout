extends KinematicBody2D

var velocity = Vector2.ZERO
var started = false
var ball_x_pos = 378.078
var ball_y_pos = 281.434
var score = 0
var lives = 3
var canDestroyBrick = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$"BallImage2".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_select") and started == false and lives > 0:
		randomize()
		velocity.x = [-1,1][randi() % 2] * 250
		velocity.y = 400
		started = true
		$"../Start".visible = false
	
	var collided = move_and_collide(velocity * delta)
	
	if collided:
		velocity = velocity.bounce(collided.normal);
		if collided.collider.name.begins_with("Brick"):
			$Hit.play()
			$"../ScoreLabel".text = "Score: " + str(score)
			if canDestroyBrick:
				var tile = $"../Bricks".world_to_map(collided.position)
				$"../Bricks".set_cell(tile.x,tile.y,-1)
				canDestroyBrick = false
				$"BallImage2".hide()
				score += randi() % 500
		elif collided.collider.name.begins_with("Paddle2") and started == true:
			$"../Player".movement.y = 0
			$"../Player".movement.x = 0
			canDestroyBrick = true
			$"BallImage2".show()
			$"../Player/Position2D".collided = true
		elif collided.collider.name.begins_with("Player") and started == true:
			$Void.play()
			if lives == 3:
				$"../LivesLabel/Life3".visible = false
			elif lives == 2:
				$"../LivesLabel/Life2".visible = false
			else:
				$"../LivesLabel/Life1".visible = false
			lives -= 1
			position.x = ball_x_pos
			position.y = ball_y_pos
			velocity = Vector2.ZERO
			started = false
	else:
		$"../Player/Position2D".collided = false
	if lives == 0 || $"../Player".victory:
		$"../Win or Lose".visible = true
		restart_game()
		

func restart_game():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Menu.tscn")
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://VariantBreakout.tscn")
