extends HBoxContainer

@onready var load_button: Button = $VBoxContainer/LoadButton
@onready var clear_button: Button = $VBoxContainer/ClearButton
@onready var save_button: Button = $VBoxContainer/SaveButton
@onready var label: Label = $MarginContainer/Label

func _ready() -> void:
	save_button.grab_focus()
func _on_save_button_pressed() -> void:
	Global.save_game()


func _on_load_button_pressed() -> void:
	Global.loading = true


func _on_clear_button_pressed() -> void:
	pass # Replace with function body.


func _on_save_button_focus_entered() -> void:
	label.text = "save"

func _on_save_button_mouse_entered() -> void:
	save_button.grab_focus()
func _on_load_button_focus_entered() -> void:
	label.text = "load"

func _on_load_button_mouse_entered() -> void:
	load_button.grab_focus()

func _on_clear_button_focus_entered() -> void:
	label.text = "clear"

func _on_clear_button_mouse_entered() -> void:
	clear_button.grab_focus()
