extends Area2D

@export var player: int

var speed: int = 200
var comp_speed: int = 150
var can_go_up: bool = true
var can_go_down: bool = true

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if player == 1:
		if Input.is_action_pressed("p1_up") and can_go_up:
			position.y -= speed * delta
		if Input.is_action_pressed("p1_down") and can_go_down:
			position.y += speed * delta
	if player == 2:
		if Input.is_action_pressed("p2_up") and can_go_up:
			position.y -= speed * delta
		if Input.is_action_pressed("p2_down") and can_go_down:
			position.y += speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("roof"):
		can_go_up = false
	if area.is_in_group("floor"):
		can_go_down = false


func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("roof"):
		can_go_up = true
	if area.is_in_group("floor"):
		can_go_down = true
