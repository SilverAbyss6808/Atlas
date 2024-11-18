extends StaticBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var status = ""
var player_in_radius = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("RESET")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func open():
	status = "open"
	animated_sprite_2d.play("open")
	collision_shape_2d.disabled = true
func close():
	status = "closed"
	animated_sprite_2d.play("close")
	collision_shape_2d.disabled = false
	if timer.timeout:
		animated_sprite_2d.play("closed")


func _on_player_detect_radius_body_entered(_body: Node2D) -> void:
	animation_player.play("popup")
	print(animation_player.is_playing())
	player_in_radius = true


func _on_player_detect_radius_body_exited(_body: Node2D) -> void:
	animation_player.play("RESET")
	player_in_radius = false
