extends ProgressBar
var max_health: int
var health: int
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	value = health

func add_health(num: int):
	health += num

func sub_health(num: int):
	health -= num
	
func set_max_health(num:int):
	max_health = num
	max_value = num
