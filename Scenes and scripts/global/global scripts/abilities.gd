extends Node
@onready var player: CharacterBody2D = $".."
@onready var speed_lines: GPUParticles2D = $tach_boost/SpeedLines
@onready var tach_boost_timer: Timer = $tach_boost/tach_boost_timer
@onready var slot_1_cooldown: Timer = $slot_1_cooldown
@onready var slot_2_cooldown: Timer = $slot_2_cooldown
@onready var ui: UI = $"../playerCam/ui"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func abSlot1():
	if slot_1_cooldown.time_left == 0:
		if player.abSlot1 == "tach_boost":
			speed_lines.emitting = true
			player.speed = 300
			player.jump_velocity = -400
			tach_boost_timer.start()
		elif player.abSlot1 == "":
			pass

func abSlot2():
	if slot_2_cooldown.time_left == 0:
		if player.abSlot2 == "nano_claw":
			pass
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta: float) -> void:
	ui.slot1_cool = slot_1_cooldown.time_left
	ui.slot2_cool = slot_2_cooldown.time_left
	ui.ability1_time = tach_boost_timer.time_left
	if speed_lines.emitting == true:
		print(tach_boost_timer.time_left)
		speed_lines.position = player.position
	else:
		print(slot_1_cooldown.time_left)
		
	if Input.is_action_just_pressed("slot1"):
		abSlot1()
	if Input.is_action_just_pressed("slot2"):
		abSlot2()


func _on_tach_boost_timer_timeout() -> void:
	speed_lines.emitting = false
	player.speed = 130
	slot_1_cooldown.start()
