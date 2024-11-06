extends Node2D
@onready var player: CharacterBody2D = %player
@onready var player_cam: Camera2D = $player/playerCam


const PAUSE = preload("res://Scenes and scripts/Menus/pause_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func pause():
	get_tree().paused = true
	var pause_menu = PAUSE.instantiate()
	add_child(pause_menu)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.loading:
		Global.load_game()
		Global.set_currentLevel("res://Scenes and scripts/room1/scenes/room_1.tscn")
	Global.loading = false
	if Input.is_action_just_pressed("pause"):
		pause()
	
