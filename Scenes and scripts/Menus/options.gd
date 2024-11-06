extends CanvasLayer

@onready var save_options_button: Button = $MarginContainer/HBoxContainer/PanelContainer/OptionButtonContainer/SaveOptionsButton
@onready var container: MarginContainer = $MarginContainer/HBoxContainer/PanelContainer2/OptionsContainer

const SAVE = preload("res://Scenes and scripts/Menus/save_load_options.tscn")
const SOUND = preload("res://Scenes and scripts/Menus/sound_options.tscn")
func _ready() -> void:
	save_options_button.grab_focus()

func _on_save_options_button_pressed() -> void:
	for n in container.get_children():
		container.remove_child(n)
		n.queue_free()
	var saveOptions = SAVE.instantiate()
	container.add_child(saveOptions)
	
	
func _on_sound_options_button_pressed() -> void:
	for n in container.get_children():
		container.remove_child(n)
		n.queue_free()
	var soundOptions = SOUND.instantiate()
	container.add_child(soundOptions)

func _on_return_button_pressed() -> void:
	if get_parent().get_scene_file_path() == "res://Scenes and scripts/Menus/main_menu.tscn":
		get_tree().paused = false
	queue_free()
	
