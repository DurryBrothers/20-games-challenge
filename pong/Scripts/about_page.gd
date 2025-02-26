extends Control


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
