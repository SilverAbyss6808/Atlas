extends VBoxContainer

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
	Global.slot_1 = "tach_dash"
	Global.current_skill_in_tree = "tach_dash"

func _on_tach_dash_cooldown_1_pressed() -> void:
	skill_info = "Skill Info: Decrease cooldown by 10%"
	Global.set_skill_info(skill_info)


func _on_tach_dash_speed_1_pressed() -> void:
	pass # Replace with function body.


func _on_tach_dash_damage_1_pressed() -> void:
	pass # Replace with function body.
