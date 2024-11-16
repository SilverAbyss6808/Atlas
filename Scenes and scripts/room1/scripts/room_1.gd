extends Node2D
@onready var player: CharacterBody2D = %player
@onready var scene_transfer: Area2D = $SceneTransfer
@onready var loading_screen_timer: Timer = $loadingScreenTimer



const PAUSE = preload("res://Scenes and scripts/Menus/pause_menu.tscn")
const INFO = preload("res://Scenes and scripts/Menus/info_menu/info_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	scene_transfer.set_scene("res://Scenes and scripts/room2/room_2.tscn")
	scene_transfer.loading_screen()
	loading_screen_timer.start()
func pause():
	get_tree().paused = true
	var pause_menu = PAUSE.instantiate()
	add_child(pause_menu)

func info_menu():
	get_tree().paused = true
	var info_menu = INFO.instantiate()
	add_child(info_menu)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.loading:
		Global.load_game()
		Global.set_currentLevel("res://Scenes and scripts/room1/scenes/room_1.tscn")
	Global.loading = false
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("info_menu"):
		info_menu()
	


func _on_loading_screen_timer_timeout() -> void:
	scene_transfer.fade_out()
