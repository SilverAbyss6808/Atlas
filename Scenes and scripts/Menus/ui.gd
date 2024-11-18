extends CanvasLayer

class_name UI

@onready var health_label: Label = $Control/MarginContainer/VBoxContainer/HealthLabel
@onready var tach_label: Label = $Control/MarginContainer/VBoxContainer/TachLabel
@onready var power_label: Label = $Control/MarginContainer/VBoxContainer/PowerLabel
@onready var ability_1_bar: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot1Container/Ability1Bar"
@onready var ability_2_bar: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot2Container/Ability2Bar"
@onready var health_bar: ProgressBar = $Control/MarginContainer/VBoxContainer/HealthBar
@onready var tach_bar: ProgressBar = $Control/MarginContainer/VBoxContainer/TachBar
@onready var power_bar: ProgressBar = $Control/MarginContainer/VBoxContainer/PowerBar
@onready var slot_1_cooldown: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot1Container/Slot1Cooldown"
@onready var slot_2_cooldown: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot2Container/Slot2Cooldown"



var health = 100
var tach = 100
var power = 100
var slot1_cool = 10
var slot2_cool = 10
var ability1_time = 5
var ability2_time = .3
func _process(_delta: float) -> void:
	#slot_1_cooldown_bar.value = slot1_cool
	#slot_2_cooldown_bar.value = slot2_cool
	ability_1_bar.value = ability1_time
	slot_1_cooldown.value = slot1_cool
	ability_2_bar.value = ability2_time
	slot_2_cooldown.value = slot2_cool
	health_bar.value = health
	tach_bar.value = tach
	power_bar.value = power
	
	#slot_1_cooldown_label.text = "Slot 1: " + str(round(slot1_cool)) + "sec"
	#slot_2_cooldown_label.text = "Slot 2: " + str(round(slot2_cool)) + "sec"
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"health": health,
		"tach" :  tach,
		"power": power
	}
	return save_dict
func update_health (value):
	health += value
	health_label.text = "Health: " + str(health)
func update_tach (value):
	tach += value
	tach_label.text = "Tachyon: " + str(tach)
func update_power (value):
	power += value
	power_label.text = "Power: " + str(power)
func reload_ui(value1, value2, value3):
	health_label.text = "Health: " + str(value1)
	tach_label.text = "Tachyon: " + str(value2)
	power_label.text = "Power: " + str(value3)
