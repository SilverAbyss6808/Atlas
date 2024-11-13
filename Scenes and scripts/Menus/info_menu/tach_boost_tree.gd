extends VBoxContainer
@onready var tach_boost_icon: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TachBoostSkillIcon
@onready var tach_boost_cooldown_1: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostCooldown1
@onready var tach_boost_speed_1: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostSpeed1
@onready var tach_boost_damage_1: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer/TachBoostDamage1
@onready var tach_boost_cooldown_2: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostCooldown2
@onready var tach_boost_speed_2: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostSpeed2
@onready var tach_boost_damage_2: TextureButton = $TiersContainer/Tier1/Tier1Skills/TachBoostTree/TextureRect/PassiveSkillsContainer/HBoxContainer2/TachBoostDamage2

var skill_info = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#main skill
func _on_tach_boost_skill_icon_pressed() -> void:
	skill_info = "Skill Info: Increases speed for a set time \nCooldown: " + str(Global.tach_speed_cooldowns[0]) + "\n"
	Global.set_skill_info(skill_info)
	
func _on_tach_boost_cooldown_1_pressed() -> void:
	skill_info = "Skill Info: Lowers cooldown of tach boost by 10%"
	Global.set_skill_info(skill_info)
	
func _on_tach_boost_speed_1_pressed() -> void:
	skill_info = "Skill Info: Increases speed of tach boost by 10%"
	Global.set_skill_info(skill_info)

func _on_tach_boost_damage_1_pressed() -> void:
	skill_info = "Skill Info: Damage taken while using tach boost decreased by 5%"
	Global.set_skill_info(skill_info)

func _on_tach_boost_cooldown_2_pressed() -> void:
	skill_info = "Skill Info: Lowers cooldown of tach boost by 10%"
	Global.set_skill_info(skill_info)

func _on_tach_boost_speed_2_pressed() -> void:
	skill_info = "Skill Info: Increases speed of tach boost by 10%"
	Global.set_skill_info(skill_info)

func _on_tach_boost_damage_2_pressed() -> void:
	skill_info = "Skill Info: Damage taken while using tach boost decreased by 5%"
	Global.set_skill_info(skill_info)
