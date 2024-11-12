extends CanvasLayer

@onready var skill_info_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/SkillInfoButton
@onready var player_info_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/PlayerInfoButton
@onready var map_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/MapButton
@onready var encyclopedia_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/EncyclopediaButton
@onready var quests_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/QuestsButton
@onready var inventory_button: Button = $MarginContainer/VBoxContainer/TabsBackground/TabsContainer/InventoryButton
@onready var info_container: MarginContainer = $MarginContainer/VBoxContainer/InfoContainerBackground/InfoContainer


const SKILL = preload("res://Scenes and scripts/Menus/info_menu/skill_info.tscn")
const ENCYCLOPEDIA = preload("res://Scenes and scripts/Menus/info_menu/EN_menu/encyclopedia.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var skill_info = SKILL.instantiate()
	info_container.add_child(skill_info)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("info_menu"):
		get_tree().paused = false
		queue_free()
	



func _on_skill_info_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()
	var skill_info = SKILL.instantiate()
	info_container.add_child(skill_info)

func _on_player_info_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()


func _on_map_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()


func _on_encyclopedia_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()
	var encyclopedia = ENCYCLOPEDIA.instantiate()
	info_container.add_child(encyclopedia)

func _on_quests_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()


func _on_inventory_button_pressed() -> void:
	for n in info_container.get_children():
		info_container.remove_child(n)
		n.queue_free()
