extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func animation(value: int):
	if value == 1:
		animation_player.play("fade_in")
	elif value == 2:
		animation_player.play("fade_out")
	elif value == 3:
		animation_player.play("loading_screen")	
	else:
		print("Invalid animation choose (1-3)")
