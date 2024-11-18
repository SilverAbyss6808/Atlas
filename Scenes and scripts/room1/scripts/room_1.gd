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
	Global.paused = true
	var pause_menu = PAUSE.instantiate()
	add_child(pause_menu)

func info_menu():
	Global.paused = true
	add_child(INFO.instantiate())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if Global.loading:
		Global.load_game()
		get_tree().change_scene_to_file(Global.currentLevel)
	Global.loading = false
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("info_menu"):
		info_menu()
	


func _on_loading_screen_timer_timeout() -> void:
	scene_transfer.fade_out()
