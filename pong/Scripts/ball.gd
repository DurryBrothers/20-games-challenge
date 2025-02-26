extends Area2D

var speed: int = 220
var direction: Vector2
var x_direction: float
var y_direction: float

@onready var delete_timer: Timer = $DeleteTimer
@onready var paddle_hit: AudioStreamPlayer = $PaddleHit
@onready var score_sound: AudioStreamPlayer = $ScoreSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var start_delay_timer = get_tree().create_timer(0.5)
	await start_delay_timer.timeout
	direction = set_random_direction()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta


func set_random_direction() -> Vector2:
	var possilbe_y_directions = [-0.3, -0.4, -0.5, -0.6, 0.3, 0.4, 0.5, 0.6]
	if GameManager.player_one_turn == true:
		x_direction = -1
	else:
		x_direction = 1
	y_direction = possilbe_y_directions.pick_random()
	var random_direction: Vector2 = Vector2(x_direction, y_direction)
	return random_direction


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("paddle"):
		paddle_hit.play()
		direction.x = -direction.x
		speed += 5
	if area.is_in_group("floor") or area.is_in_group("roof"):
		direction.y = -direction.y
	if area.is_in_group("player_one_goal"):
		set_process(false)
		score_sound.play()
		GameManager.player_one_turn = false
		GameManager.player_two_score += 1
		SignalManager.update_score.emit()
		delete_timer.start()
	if area.is_in_group("player_two_goal"):
		set_process(false)
		score_sound.play()
		GameManager.player_one_turn = true
		GameManager.player_one_score += 1
		SignalManager.update_score.emit()
		delete_timer.start()


func _on_delete_timer_timeout() -> void:
	queue_free()
	SignalManager.ball_destroyed.emit()
