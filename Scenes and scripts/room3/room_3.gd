extends Node2D
@onready var player: CharacterBody2D = %player
@onready var scene_transfer: Area2D = $SceneTransfer
const PAUSE = preload("res://Scenes and scripts/Menus/pause_menu.tscn")
const INFO = preload("res://Scenes and scripts/Menus/info_menu/info_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.level = "res://Scenes and scripts/room3/room_3.tscn"
	if Global.loading:
		Global.load_game()
		Global.loading = false
	else:
		Global.save_game()
	scene_transfer.fade_out()
	scene_transfer.set_scene("res://Scenes and scripts/room1/scenes/room_1.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()
	if Input.is_action_just_pressed("info_menu"):
		info_menu()

func pause():
	Global.paused = true
	add_child(PAUSE.instantiate())

func info_menu():
	Global.paused = true
	add_child(INFO.instantiate())
