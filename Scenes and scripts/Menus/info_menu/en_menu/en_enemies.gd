extends HBoxContainer
@onready var enemy_info_page: MarginContainer = $EnemyInfoPage
@onready var gunker_but: Button = $ScrollContainer/VBoxContainer/GunkerBut
@onready var jumper_but: Button = $ScrollContainer/VBoxContainer/JumperBut
@onready var shambler_but: Button = $ScrollContainer/VBoxContainer/ShamblerBut
const GUNKER = preload("res://Scenes and scripts/Menus/info_menu/en_menu/en_enemies_gunker.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gunker_but_pressed() -> void:
	for n in enemy_info_page.get_children():
		enemy_info_page.remove_child(n)
		n.queue_free()
	enemy_info_page.add_child(GUNKER.instantiate())

func _on_jumper_but_pressed() -> void:
	for n in enemy_info_page.get_children():
		enemy_info_page.remove_child(n)
		n.queue_free()


func _on_shambler_but_pressed() -> void:
	for n in enemy_info_page.get_children():
		enemy_info_page.remove_child(n)
		n.queue_free()
