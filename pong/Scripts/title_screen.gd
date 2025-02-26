extends Control

@onready var ui_select_sound: AudioStreamPlayer = $ui_select_sound

func _on_play_button_pressed() -> void:
	ui_select_sound.play()
	await ui_select_sound.finished
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_about_button_pressed() -> void:
	ui_select_sound.play()
	await ui_select_sound.finished
	get_tree().change_scene_to_file("res://Scenes/about_page.tscn")


func _on_quit_button_pressed() -> void:
	ui_select_sound.play()
	await ui_select_sound.finished
	get_tree().quit()
