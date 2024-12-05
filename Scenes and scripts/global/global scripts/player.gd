extends CharacterBody2D



@onready var player_cam: Camera2D = $playerCam
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: UI = $playerCam/UI
@onready var sit_timer: Timer = $SitTimer
@onready var lay_timer: Timer = $LayTimer
@onready var abilities: Node = $Abilities
@onready var nano_claw_timer: Timer = $Abilities/nano_claw/nano_claw_timer
@onready var ability_animations: AnimationPlayer = $Abilities/AbilityAnimations
@onready var action_detect: Area2D = $ActionDetect


#speeds
var jump_velocity = -300.0
var speed = 130
#player values
var health = 100
var tach = 100
var power = 100
var level = ""
#ability slots
var abSlot1 = "tach_boost"
var abSlot2 = "nano_claw"


func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"health": health,
		"tach" :  tach,
		"level": level,
		"power": power,
	}
	return save_dict

#check for actionable and start dialogue
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		var actionables = action_detect.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _ready() -> void:
	#reload ui
	ui.reload_ui(health, tach, power)
	
	#set global variables for ability slots
	Global.slot_1 = abSlot1
	Global.slot_2 = abSlot2
	abSlot1 = Global.slot_1
	abSlot2 = Global.slot_2
	
func _physics_process(delta: float) -> void:
	#set global variables for position
	ui.set_bar_max("health", Global.player_max[0])
	ui.set_bar_max("tach", Global.player_max[1])
	ui.set_bar_max("power", Global.player_max[2])
	Global.player_x = position.x
	Global.player_y = position.y
	#reload ui
	ui.reload_ui(health, tach, power)
	
	
	
	#kill player if health <= 0
	if ui.health <= 0:
		print("dead")
		get_tree().reload_current_scene()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") or  Input.is_action_just_pressed("left") or  Input.is_action_just_pressed("right"):
		sit_timer.start()
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity


	
	#get direction based on input right and left
	var direction := Input.get_axis("left", "right")
	
	#flip sprite based on direction and set direction for abilities script
	if direction > 0:
		abilities.player_direction = 1
		animated_sprite.flip_h=false
	elif direction < 0:
		abilities.player_direction = -1
		animated_sprite.flip_h=true
	#active for tach_dash
	if abilities.dash == true:
		direction = abilities.player_direction
	
	#animation players
	if is_on_floor():
		if direction == 0 and animated_sprite.animation != "stand_to_sit" and animated_sprite.animation != "sit_to_lay":
			animated_sprite.play("idle")
		elif direction != 0:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	
	#move player based on direction
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func blue_ball():
	if health >= 90:
		health += (100-health)
		ui.update_health(100-health)
	else:
		health += 10
		ui.update_health(10)

func yellow_ball():
	if tach >= 90:
		tach += (100-tach)
		ui.update_tach(100-tach)
	else:
		tach += 10
		ui.update_tach(10)

#set player and ui health
func set_health(value):
	health += value
	ui.update_health(value)

#sit animation timer
func _on_sit_timer_timeout() -> void:
	animated_sprite.play("stand_to_sit")
	lay_timer.start()

#lay animation timer
func _on_lay_timer_timeout() -> void:
	animated_sprite.play("sit_to_lay")

func reload_values():
	health = Global.p_health
	tach = Global.p_tach
	power = Global.p_power
