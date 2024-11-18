extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var direction_timer: Timer = $direction_timer
@onready var search_timer: Timer = $search_timer
@onready var detect_collider: CollisionPolygon2D = $DetectArea/DetectCollider
@onready var activate_radius_collider: CollisionShape2D = $ActivateRadius/ActivateRadiusCollider
@onready var attack_timer: Timer = $attackTimer
@onready var detect_timer: Timer = $detect_timer
@onready var point_light_2d: PointLight2D = $DetectArea/PointLight2D


const SPEED = 70.0
const JUMP_VELOCITY = -400.0
var direction = 0
var area1_active: bool
var area2_active: bool
var state = "idle"
var inital:float
var timer_check = 0
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if state == "attacking":
		point_light_2d.energy = 5
		point_light_2d.color = "770011b6"
		search_timer.stop()
		activate_radius_collider.disabled = true
		if Global.player_x > position.x:
			detect_collider.rotation = 3.14
			direction = 1
		elif Global.player_x < position.x:
			detect_collider.rotation = 0
			direction = -1
		elif Global.player_x == position.x:
			direction = 0
	elif state == "idle":
		point_light_2d.energy = 3
		detect_collider.disabled = true
		direction = 0
	elif state == "searching":
		point_light_2d.color = "866311d6"
		point_light_2d.energy = 3
	if not is_on_floor():
		velocity += get_gravity() * delta

	if state == "searching" and area2_active:
		if Global.player_x != inital:
			state = "attacking"
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if direction == 1:
		animated_sprite_2d.flip_h = true
	elif direction == -1:
		animated_sprite_2d.flip_h = false
	move_and_slide()

func  close_eye():
	animated_sprite_2d.play("close_eye")

func open_eye():
	animated_sprite_2d.play("open_eye")

func _on_timer_timeout() -> void:
	if area1_active:
		detect_collider.disabled = false
		direction = 1
		state = "searching"
		direction_timer.start()
		animation_player.play("searching")
		search_timer.start()

func _on_activate_radius_body_entered(body: Node2D) -> void:
	area1_active = true
	timer.start()

func _on_activate_radius_body_exited(body: Node2D) -> void:
	area1_active = true


func _on_detect_area_body_entered(body: Node2D) -> void:
	detect_timer.start()
	
func _on_detect_area_body_exited(body: Node2D) -> void:
	attack_timer.start()
	area2_active = false


func _on_direction_timer_timeout() -> void:
	if state == "searching":
		direction *= -1
		if direction == 1:
			detect_collider.rotation = 3.14
		elif direction == -1:
			detect_collider.rotation = 0

func _on_search_timer_timeout() -> void:
	state = "idle"
	timer_check = 0



func _on_test_timer_timeout() -> void:
	print(state)
	print("Player pos: " + str(Global.player_x) + "\nInital p: " + str(inital))
	if state == "searching" and timer_check == 0:
		timer_check = 1
		search_timer.start()


func _on_attack_timer_timeout() -> void:
	activate_radius_collider.disabled = false
	state = "searching"


func _on_detect_timer_timeout() -> void:
	inital = Global.player_x
	area2_active = true
