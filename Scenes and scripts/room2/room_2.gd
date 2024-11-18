extends Node2D
@onready var player: CharacterBody2D = %player
@onready var door: StaticBody2D = $Door
@onready var door_2: StaticBody2D = $Door2
@onready var scene_transfer: Area2D = $SceneTransfer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scene_transfer.fade_out()
	scene_transfer.set_scene("res://Scenes and scripts/room1/scenes/room_1.tscn")
	player.player_cam.limit_left = -200
	door.close()
	door_2.close()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if player.position.x >= -10:
		player.player_cam.limit_left = -10000000
	
	#if dialogue is active pause game
	
	
	if door.player_in_radius:
		if Input.is_action_just_pressed("interact"):
			if door.status == "closed":
				door.open()
			elif door.status == "open":
				door.close()
	
	if door_2.player_in_radius:
		if Input.is_action_just_pressed("interact"):
			if door_2.status == "closed":
				door_2.open()
			elif door_2.status == "open":
				door_2.close()
