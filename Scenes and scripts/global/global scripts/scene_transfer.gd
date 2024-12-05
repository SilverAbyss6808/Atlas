extends Area2D
@onready var timer: Timer = $Timer
@onready var transition_mask: CanvasLayer = $TransitionMask
@onready var timer_2: Timer = $Timer2

var scene: String
func _ready() -> void:
	transition_mask.visible = false
	

func set_scene(value: String):
	scene = value

func _on_body_entered(body: Node2D) -> void:
	Global.p_health = body.health
	Global.p_tach = body.tach
	Global.p_power = body.power
	if scene != "":
		timer.start()
		fade_in()
		return
	else:
		print("error: no scene called")
		return

func fade_in():
	transition_mask.visible = true
	transition_mask.animation(1)
	
func fade_out():
	transition_mask.visible = true
	transition_mask.animation(2)
	
func loading_screen():
	transition_mask.visible = true
	transition_mask.animation(3)

func _on_timer_timeout() -> void:
	loading_screen()
	timer_2.start()


func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file(scene)
