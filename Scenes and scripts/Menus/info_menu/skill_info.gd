extends VBoxContainer

const SPEED = preload("res://Scenes and scripts/Menus/info_menu/Tach_Speed_Tree.tscn")
const SLOW = preload("res://Scenes and scripts/Menus/info_menu/tach_slow_tree.tscn")
const ATTACK = preload("res://Scenes and scripts/Menus/info_menu/nano_attack_tree.tscn")
const BUFF = preload("res://Scenes and scripts/Menus/info_menu/nano_buff_tree.tscn")
@onready var skill_tree_container: MarginContainer = $HBoxContainer/SkillTreeContainer
@onready var next_tree_button: Button = $HBoxContainer/NextTreeButton
@onready var prev_tree_button: Button = $HBoxContainer/PrevTreeButton
@onready var skill_tree_label: Label = $SkillTreeLabelBackground/SkillTreeLabel
@onready var skill_info_label: Label = $HBoxContainer/ColorRect/VBoxContainer/MarginContainer/SkillInfoLabel
@onready var ability_unlock_button: Button = $HBoxContainer/ColorRect/VBoxContainer/AbilityUnlockButton
var tree_num = 0
var trees = [SPEED,SLOW,ATTACK,BUFF]
var tree_labels = ["Tachyon Speed", "Tachyon Slow", "Nano Attack", "Nano Buff"]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	skill_tree_container.add_child(trees[0].instantiate())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	skill_info_label.text = Global.skill_info


func _on_prev_tree_button_pressed() -> void:
	for n in skill_tree_container.get_children():
		skill_tree_container.remove_child(n)
		n.queue_free()
	if tree_num == 0:
		tree_num = 3 
	else:
		tree_num -= 1
	skill_tree_label.text = tree_labels[tree_num]
	skill_tree_container.add_child(trees[tree_num].instantiate())


func _on_next_tree_button_pressed() -> void:
	for n in skill_tree_container.get_children():
		skill_tree_container.remove_child(n)
		n.queue_free()
	if tree_num == 3:
		tree_num = 0 
	else:
		tree_num += 1
	skill_tree_label.text = tree_labels[tree_num]
	skill_tree_container.add_child(trees[tree_num].instantiate())
