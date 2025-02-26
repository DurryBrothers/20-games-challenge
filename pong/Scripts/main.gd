extends Node2D

var ball_scene: PackedScene = preload("res://Scenes/ball.tscn")

@onready var ball_spawn_pos: Marker2D = $BallSpawnPos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_ball()
	SignalManager.ball_destroyed.connect(_on_ball_destroyed)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func spawn_ball() -> void:
	var new_ball = ball_scene.instantiate()
	ball_spawn_pos.add_child(new_ball)


func _on_ball_destroyed():
	spawn_ball()
