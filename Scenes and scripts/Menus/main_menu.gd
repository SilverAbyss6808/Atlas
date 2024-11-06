extends Control

@onready var continue_button: Button = $VBoxContainer/ContinueButton
@onready var new_game_button: Button = $VBoxContainer/NewGameButton
@onready var options_button: Button = $VBoxContainer/OptionsButton
@onready var quit_button: Button = $VBoxContainer/QuitButton
const OPTIONS = preload("res://Scenes and scripts/Menus/options.tscn")
func _ready() -> void:
	continue_button.grab_focus()
	print(Global.loading)

func _on_continue_button_pressed() -> void:
	Global.loading = true
	get_tree().change_scene_to_file("res://Scenes and scripts/room1/scenes/room_1.tscn")


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes and scripts/room1/scenes/room_1.tscn")
	

func _on_options_button_pressed() -> void:
	var options_menu = OPTIONS.instantiate()
	add_child(options_menu)
	get_tree().paused = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
