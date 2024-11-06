extends HBoxContainer

@onready var master_label: Label = $MarginContainer/VBoxContainer/MasterLabel
@onready var master_slider: HSlider = $MarginContainer/VBoxContainer/MasterSlider
@onready var sfx_label: Label = $MarginContainer/VBoxContainer/SfxLabel
@onready var sfx_slider: HSlider = $MarginContainer/VBoxContainer/SfxSlider
@onready var music_label: Label = $MarginContainer/VBoxContainer/MusicLabel
@onready var music_slider: HSlider = $MarginContainer/VBoxContainer/MusicSlider
@export
var bus_name: String
var bus_index: int	

func _on_master_slider_value_changed(value: float) -> void:
	bus_index = AudioServer.get_bus_index("Master")
	master_label.text="Master: " + str(value * 100) + "%"
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func _on_sfx_slider_value_changed(value: float) -> void:
	bus_index = AudioServer.get_bus_index("Sfx")
	sfx_label.text="Sfx: " + str(value * 100) + "%"
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
func _on_music_slider_value_changed(value: float) -> void:
	bus_index = AudioServer.get_bus_index("Music")
	music_label.text="Music: " + str(value * 100) + "%"
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
