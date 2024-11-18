extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if DialogueGlobal.sprite_state1 == "neutral":
		play("neutral")
	elif DialogueGlobal.sprite_state1 == "neutral_talk":
		play("neutral_talk")
	#elif DialogueGlobal.sprite_state1 == "happy":
		#play("happy")
	#elif DialogueGlobal.sprite_state1 == "happy_talk":
		#play("happy_talk")
	#elif DialogueGlobal.sprite_state1 == "sad":
		#play("sad")
	#elif DialogueGlobal.sprite_state1 == "sad_talk":
		#play("sad_talk")
	#elif DialogueGlobal.sprite_state1 == "angry":
		#play("angry")
	#elif DialogueGlobal.sprite_state1 == "angry_talk":
		#play("angry_talk")
