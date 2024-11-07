extends CanvasLayer

class_name UI

@onready var health_label: Label = $Control/MarginContainer/VBoxContainer/HealthLabel
@onready var tach_label: Label = $Control/MarginContainer/VBoxContainer/TachLabel
@onready var slot_1_cooldown_bar: ProgressBar = $Control/MarginContainer/MarginContainer/CooldownContainer/Slot1CooldownBar
@onready var slot_1_cooldown_label: Label = $Control/MarginContainer/MarginContainer/CooldownContainer/Slot1CooldownLabel
@onready var slot_2_cooldown_bar: ProgressBar = $Control/MarginContainer/MarginContainer/CooldownContainer/Slot2CooldownBar
@onready var slot_2_cooldown_label: Label = $Control/MarginContainer/MarginContainer/CooldownContainer/Slot2CooldownLabel
@onready var ability_1_bar: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot1Container/Ability1Bar"
@onready var ability_2_bar: ProgressBar = $"Control/MarginContainer/MarginContainer2/Ability container/Slot2Container/Ability2Bar"



var health = 100
var tach = 100
var slot1_cool = 10
var slot2_cool = 10
var ability1_time = 5
var ability2_time = .5
func _process(delta: float) -> void:
	slot_1_cooldown_bar.value = slot1_cool
	slot_2_cooldown_bar.value = slot2_cool
	ability_1_bar.value = ability1_time
	ability_2_bar.value = ability2_time
	slot_1_cooldown_label.text = "Slot 1: " + str(round(slot1_cool)) + "sec"
	slot_2_cooldown_label.text = "Slot 2: " + str(round(slot2_cool)) + "sec"
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
