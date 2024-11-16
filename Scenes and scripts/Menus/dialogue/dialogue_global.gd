extends Node

var sprite_state1 = "neutral"
var sprite_state2 = "neutral"
var character1 = "Atlas"
var character2 = "Beebo"
var dialogue_active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dialogue_active:
		get_tree().paused = true
	else:
		get_tree().paused = false
