extends VBoxContainer
@onready var tach_dash_skill_icon: TextureButton = $TachDashSkillIcon
@onready var tach_dash_cooldown_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachDashCooldown1
@onready var tach_dash_speed_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachDashSpeed1
@onready var tach_dash_damage_1: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer/TachDashDamage1
@onready var tach_dash_cooldown_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachDashCooldown2
@onready var tach_dash_speed_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachDashSpeed2
@onready var tach_dash_damage_2: TextureButton = $TextureRect/PassiveSkillsContainer/HBoxContainer2/TachDashDamage2

var skill_unlock = [true,true,true,true,true,true,true,true]
var skill_id = [1,.121,.122,.123,.124,.125,.126]
var skill_info = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_tach_dash_skill_icon_pressed() -> void:
	skill_info = "Skill Info: Dash for a set time \nCooldown: " + str(Global.tach_speed_cooldowns[1]) + "\n"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = 1

func _on_tach_dash_cooldown_1_pressed() -> void:
	skill_info = "Skill Info: Decrease cooldown by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .121

func _on_tach_dash_speed_1_pressed() -> void:
	skill_info = "Skill Info: Increase speed of dash by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .122


func _on_tach_dash_damage_1_pressed() -> void:
	skill_info = "Skill Info: Decrease damage taken during dash by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .123

func _on_tach_dash_cooldown_2_pressed() -> void:
	skill_info = "Skill Info: Decrease cooldown by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .124


func _on_tach_dash_speed_2_pressed() -> void:
	skill_info = "Skill Info: Increase speed of dash by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .125


func _on_tach_dash_damage_2_pressed() -> void:
	skill_info = "Skill Info: Decrease damage taken during dash by 10%"
	Global.set_skill_info(skill_info)
	Global.current_skill_in_tree = .126
	
	
func unlock():
	if skill_unlock[0]:
		tach_dash_skill_icon.disabled = false
	else:
		tach_dash_skill_icon.disabled = true
	
	if skill_unlock[1]:
		tach_dash_cooldown_1.disabled = false
	else:
		tach_dash_cooldown_1.disabled = true
	
	if skill_unlock[2]:
		tach_dash_speed_1.disabled = false
	else:
		tach_dash_speed_1.disabled = true
	
	if skill_unlock[3]:
		tach_dash_damage_1.disabled = false
	else:
		tach_dash_damage_1.disabled = true
	
	if skill_unlock[4]:
		tach_dash_cooldown_2.disabled = false
	else:
		tach_dash_cooldown_2.disabled = true
	
	if skill_unlock[5]:
		tach_dash_speed_2.disabled = false
	else:
		tach_dash_speed_2.disabled = true
	
	if skill_unlock[6]:
		tach_dash_damage_2.disabled = false
	else:
		tach_dash_damage_2.disabled = true



func _on_ability_unlock_button_pressed() -> void:
	print(Global.current_skill_in_tree)
	if Global.current_skill_in_tree == skill_id[0]:
		skill_unlock[0] = true
	elif Global.current_skill_in_tree == skill_id[1]:
		skill_unlock[1] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
	elif Global.current_skill_in_tree == skill_id[2]:
		skill_unlock[2] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
	elif Global.current_skill_in_tree == skill_id[3]:
		skill_unlock[3] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
	elif Global.current_skill_in_tree == skill_id[4]:
		skill_unlock[4] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
	elif Global.current_skill_in_tree == skill_id[5]:
		skill_unlock[5] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
	elif Global.current_skill_in_tree == skill_id[6]:
		skill_unlock[6] = false
		Global.tach_speed_cooldowns[1] -= (Global.tach_speed_cooldowns[1]*.1)
