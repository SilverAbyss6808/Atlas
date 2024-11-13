extends Node2D
@onready var ray_right: RayCast2D = $ray_right
@onready var ray_left: RayCast2D = $ray_left
@onready var sprite_2d: Sprite2D = $Sprite2D

var health = 110
var speed = 60
var direction = 1
func _process(delta: float) -> void:
	if !ray_left.is_colliding():
		direction = 1
		sprite_2d.flip_h = true
	if !ray_right.is_colliding():
		direction = -1
		sprite_2d.flip_h = false
	position.x += direction * speed * delta
	
	if health <=0:
		queue_free()
func _on_main_collider_body_entered(body: Node2D) -> void:
	body.set_health(-20)


func _on_hit_collider_area_entered(area: Area2D) -> void:
	health += -50
