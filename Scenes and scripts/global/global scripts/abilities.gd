extends Node
@onready var player: CharacterBody2D = $".."
@onready var speed_lines: GPUParticles2D = $tach_boost/SpeedLines
@onready var tach_boost_timer: Timer = $tach_boost/tach_boost_timer
@onready var slot_1_cooldown: Timer = $slot_1_cooldown
@onready var slot_2_cooldown: Timer = $slot_2_cooldown

@onready var ui: UI = $"../playerCam/UI"
@onready var ability_animations: AnimationPlayer = $AbilityAnimations
@onready var nano_claw_timer: Timer = $nano_claw/nano_claw_timer
@onready var nano_claw_collider: Area2D = $nano_claw/nano_claw_collider
@onready var animated_sprite_2d: AnimatedSprite2D = $nano_claw/nano_claw_collider/AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $nano_claw/nano_claw_collider/CollisionShape2D



var tach_boost_cooldown = 10
var nano_claw_cooldown = .5
var player_direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func abSlot1():
	if slot_1_cooldown.time_left == 0:
		
		if player.abSlot1 == "tach_boost":
			if player.tach >= 20:
				player.tach += -20
				ui.update_tach(-20)
				speed_lines.emitting = true
				player.speed = 300
				player.jump_velocity = -400
				tach_boost_timer.start()
				slot_1_cooldown.start()
				
			else:
				pass
			
		elif player.abSlot1 == "":
			pass

func abSlot2():
	if slot_2_cooldown.time_left == 0:
		if player.abSlot2 == "nano_claw":
			if player.power >= 10:
				ui.update_power(-10)
				player.power += -10
				if player_direction > 0:
					ability_animations.play("nano_claw_right")
				elif player_direction < 0:
					ability_animations.play("nano_claw_left")
				nano_claw_timer.start()
				slot_2_cooldown.start()
				
			else:
				pass
			
		elif player.abSlot2 == "":
			pass
			
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta: float) -> void:
	ui.slot1_cool = slot_1_cooldown.time_left
	ui.slot2_cool = slot_2_cooldown.time_left
	ui.ability1_time = tach_boost_timer.time_left
	ui.ability2_time = nano_claw_timer.time_left
	
	nano_claw_collider.position.x = player.position.x + 20
	nano_claw_collider.position.y = player.position.y-10
	animated_sprite_2d.position = nano_claw_collider.position
	collision_shape_2d.position = nano_claw_collider.position
	if player_direction > 0:
		if speed_lines.emitting == true:
			speed_lines.process_material.set("direction", Vector3(-1,0,0))
	elif player_direction < 0:
		if speed_lines.emitting == true:
			speed_lines.process_material.set("direction", Vector3(1,0,0))
		
		
	if speed_lines.emitting == true:
		speed_lines.position = player.position
	
	
	
	if Input.is_action_just_pressed("slot1"):
		abSlot1()
	if Input.is_action_just_pressed("slot2"):
		abSlot2()


func _on_tach_boost_timer_timeout() -> void:
	speed_lines.emitting = false
	player.speed = 130
	
	

func _on_nano_claw_timer_timeout() -> void:
	ability_animations.play("RESET")
	
