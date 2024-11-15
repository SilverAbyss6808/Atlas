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



var jump_velocity = -300.0
var speed = 130

var health = 100
var tach = 100
var power = 100
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
		"power": power,
		"Level" : Global.currentLevel
	}
	return save_dict

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		var actionables = action_detect.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return

func _ready() -> void:
	ui.reload_ui(health, tach, power)
	Global.slot_1 = abSlot1
	Global.slot_2 = abSlot2
	abSlot1 = Global.slot_1
	abSlot2 = Global.slot_2
func _physics_process(delta: float) -> void:
	Global.player_x = position.x
	Global.player_y = position.y
	
	ui.reload_ui(health, tach, power)
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


	
	
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		abilities.player_direction = 1
		animated_sprite.flip_h=false
	elif direction < 0:
		abilities.player_direction = -1
		animated_sprite.flip_h=true
	if abilities.dash == true:
		direction = abilities.player_direction
	if is_on_floor():
		if direction == 0 and animated_sprite.animation != "stand_to_sit" and animated_sprite.animation != "sit_to_lay":
			animated_sprite.play("idle")
		elif direction != 0:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


func blue_ball():
	health += 10
	ui.update_health(10)

func yellow_ball():
	power += 10
	ui.update_power(10)
func set_health(value):
	health += value
	ui.update_health(value)
	
func _on_sit_timer_timeout() -> void:
	animated_sprite.play("stand_to_sit")
	lay_timer.start()

func _on_lay_timer_timeout() -> void:
	animated_sprite.play("sit_to_lay")
