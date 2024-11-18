extends CanvasLayer

const OPTIONS = preload("res://Scenes and scripts/Menus/options.tscn")
func _ready() -> void:
	get_tree().paused = true
func _on_resume_button_pressed() -> void:
	Global.paused = false
	queue_free()


func _on_options_button_pressed() -> void:
	print("meow")
	var options_menu = OPTIONS.instantiate()
	add_child(options_menu)
	
	
	


func _on_quit_button_pressed() -> void:
	Global.paused = false
	get_tree().change_scene_to_file("res://Scenes and scripts/Menus/main_menu.tscn")
