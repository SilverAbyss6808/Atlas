extends VBoxContainer
@onready var skill_info_label: Label = $"../../../../../ColorRect/VBoxContainer/MarginContainer/SkillInfoLabel"
@onready var tach_boost_skill_icon: TextureButton = $TachBoostSkillIcon
@onready var tach_boost_cooldown_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostCooldown1
@onready var tach_boost_speed_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostSpeed1
@onready var tach_boost_damage_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostDamage1
@onready var tach_boost_cooldown_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostCooldown2
@onready var tach_boost_speed_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostSpeed2
@onready var tach_boost_damage_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostDamage2

var skill_unlock = [true,true,true,true,true,true,true,true]
var skill_id = [0,.111,.112,.113,.114,.115,.116]
var skill_info = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	skill_info_label.text = Global.skill_info
	unlock()

#main skill
func _on_tach_boost_skill_icon_pressed() -> void:
	skill_info = "Skill Info: Increases speed for a set time \nCooldown: " + str(Global.tach_speed_cooldowns[0]) + "\n"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = 0
	
func _on_tach_boost_cooldown_1_pressed() -> void:
	skill_info = "Skill Info: Lowers cooldown of tach boost by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .111
	
func _on_tach_boost_speed_1_pressed() -> void:
	skill_info = "Skill Info: Increases speed of tach boost by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .112

func _on_tach_boost_damage_1_pressed() -> void:
	skill_info = "Skill Info: Damage taken while using tach boost decreased by 5%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .113

func _on_tach_boost_cooldown_2_pressed() -> void:
	skill_info = "Skill Info: Lowers cooldown of tach boost by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .114

func _on_tach_boost_speed_2_pressed() -> void:
	skill_info = "Skill Info: Increases speed of tach boost by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .115
func _on_tach_boost_damage_2_pressed() -> void:
	skill_info = "Skill Info: Damage taken while using tach boost decreased by 5%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree =.116
func unlock():
	if skill_unlock[0]:
		tach_boost_skill_icon.disabled = false
	else:
		tach_boost_skill_icon.disabled = true
	
	if skill_unlock[1]:
		tach_boost_cooldown_1.disabled = false
	else:
		tach_boost_cooldown_1.disabled = true
	
	if skill_unlock[2]:
		tach_boost_speed_1.disabled = false
	else:
		tach_boost_speed_1.disabled = true
	
	if skill_unlock[3]:
		tach_boost_damage_1.disabled = false
	else:
		tach_boost_damage_1.disabled = true
	
	if skill_unlock[4]:
		tach_boost_cooldown_2.disabled = false
	else:
		tach_boost_cooldown_2.disabled = true
	
	if skill_unlock[5]:
		tach_boost_speed_2.disabled = false
	else:
		tach_boost_speed_2.disabled = true
	
	if skill_unlock[6]:
		tach_boost_damage_2.disabled = false
	else:
		tach_boost_damage_2.disabled = true
	

func _on_ability_unlock_button_pressed() -> void:
	print(Global.current_skill_in_tree)
	if Global.current_skill_in_tree == skill_id[0]:
		skill_unlock[0] = true
	elif Global.current_skill_in_tree == skill_id[1]:
		skill_unlock[1] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)
	elif Global.current_skill_in_tree == skill_id[2]:
		skill_unlock[2] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)
	elif Global.current_skill_in_tree == skill_id[3]:
		skill_unlock[3] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)
	elif Global.current_skill_in_tree == skill_id[4]:
		skill_unlock[4] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)
	elif Global.current_skill_in_tree == skill_id[5]:
		skill_unlock[5] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)
	elif Global.current_skill_in_tree == skill_id[6]:
		skill_unlock[6] = false
		Global.tach_speed_cooldowns[0] -= (Global.tach_speed_cooldowns[0]*.1)


func _on_equip_button_pressed() -> void:
	if Global.current_skill_in_tree == 0 and skill_unlock[0]:
		Global.slot_1 = "tach_boost"
	else:
		pass
