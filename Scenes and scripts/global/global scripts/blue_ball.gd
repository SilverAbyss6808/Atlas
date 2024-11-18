extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player: CharacterBody2D = %player


var touched = false
func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x, 
		"pos_y" : position.y,
		"touched" : touched
	}
	return save_dict
func _on_body_entered(body: Node2D) -> void:
	print("shsba")
	if touched == false:
		animation_player.play("die")
		Engine.time_scale += -.1
		body.blue_ball()
		touched = true
