extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ui: UI = $playerCam/ui
@onready var sit_timer: Timer = $SitTimer
@onready var lay_timer: Timer = $LayTimer
var health = 100
var tach = 100
var power = 100
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, 
		"pos_y" : position.y,
		"health": health,
		"tach" :  tach,
		"Level" : Global.currentLevel
	}
	return save_dict
func _ready() -> void:
	ui.reload_ui(health, tach)
func _physics_process(delta: float) -> void:
	ui.reload_ui(health, tach)
	#if ui.health == 0:
		#get_tree().reload_current_scene()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") or  Input.is_action_just_pressed("left") or  Input.is_action_just_pressed("right"):
		sit_timer.start()
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		animated_sprite.flip_h=false
	elif direction < 0:
		animated_sprite.flip_h=true
	
	if is_on_floor():
		if direction == 0 and animated_sprite.animation != "stand_to_sit" and animated_sprite.animation != "sit_to_lay":
			animated_sprite.play("idle")
		elif direction != 0:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func blue_ball():
	health += -10
	ui.update_health(-10)

func yellow_ball():
	tach += -10
	ui.update_tach(-10)


func _on_sit_timer_timeout() -> void:
	animated_sprite.play("stand_to_sit")
	lay_timer.start()

func _on_lay_timer_timeout() -> void:
	animated_sprite.play("sit_to_lay")
