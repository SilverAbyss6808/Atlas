extends Area2D
@onready var timer: Timer = $Timer
@onready var transition_mask: CanvasLayer = $TransitionMask
@onready var timer_2: Timer = $Timer2

var scene = ""

func _ready() -> void:
	transition_mask.visible = false
	

func set_scene(value: String):
	scene = value
	


func _on_body_entered(body: Node2D) -> void:
	if scene != "":
		timer.start()
		fade_in()
		return
	else:
		print("error: no scene called")
		return

func fade_in():
	get_tree().paused = true
	transition_mask.visible = true
	transition_mask.animation(1)
	
func fade_out():
	get_tree().paused = false
	transition_mask.visible = true
	transition_mask.animation(2)
	
func loading_screen():
	get_tree().paused = true
	transition_mask.visible = true
	transition_mask.animation(3)

func _on_timer_timeout() -> void:
	loading_screen()
	timer_2.start()


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file(scene)
