extends Area2D

const Balloon = preload("res://Scenes and scripts/Menus/dialogue/dialogue_bubble.tscn")
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "Beebo"



func action() -> void:
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue_resource,dialogue_start)
