extends CanvasLayer

class_name UI

@onready var health_label: Label = $Control/MarginContainer/VBoxContainer/HealthLabel
@onready var tach_label: Label = $Control/MarginContainer/VBoxContainer/TachLabel

var health = 100
var tach = 100

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"health": health,
		"tach" :  tach
	}
	return save_dict
func update_health (value):
	health += value
	health_label.text = "Health: " + str(health) + "%"
func update_tach (value):
	tach += value
	tach_label.text = "Tachyon Level: " + str(tach) + "%"
func reload_ui(value1, value2):
	health_label.text = "Health: " + str(value1) + "%"
	tach_label.text = "Tachyon Level: " + str(value2) + "%"
