extends HBoxContainer

@onready var page_container: MarginContainer = $PageContainer

const ENEMIES = preload("res://Scenes and scripts/Menus/info_menu/en_menu/en_enemies.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_enemies_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()
	var enemy_enc = ENEMIES.instantiate()
	page_container.add_child(enemy_enc)



func _on_characters_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()


func _on_locations_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()


func _on_abilities_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()


func _on_items_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()


func _on_yib_entries_button_pressed() -> void:
	for n in page_container.get_children():
		page_container.remove_child(n)
		n.queue_free()
