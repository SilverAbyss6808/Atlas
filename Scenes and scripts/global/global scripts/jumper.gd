extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player_collider: Area2D = $PlayerCollider
@onready var jump_timer: Timer = $JumpTimer
@onready var health_bar: ProgressBar = $HealthBar


var jump_velocity = -400.0
var speed = 100
var direction = 0
var health = 60
var detect_radius = 200
var player_in_radius = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.set_max_health(health)
	health_bar.add_health(health)
	jump_timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (position.x - Global.player_x) <= detect_radius and (position.x - Global.player_x) >= -detect_radius :
		player_in_radius = true
	else:
		player_in_radius = false
	

func _physics_process(delta: float) -> void:
	if health <=0:
		queue_free()
	
	if is_on_floor():
		direction = 0
		animated_sprite_2d.play("idle")
	else:
		if player_in_radius:
			if Global.player_x > position.x:
				direction = 1
			else:
				direction = -1
			velocity += get_gravity() * delta
			animated_sprite_2d.play("jump")
	
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()

func _on_jump_timer_timeout():
	jump_timer.start()
	if is_on_floor():
		velocity.y = jump_velocity

func _on_player_collider_body_entered(body: Node2D) -> void:
	print("colliding")
	body.set_health(-10)

func _on_hit_area_entered(_area: Area2D) -> void:
	health_bar.sub_health(50)
	health += -50
