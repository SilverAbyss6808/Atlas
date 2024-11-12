extends VBoxContainer
class_name TI
@onready var safe_ind: TextureRect = $HBoxContainer2/safeInd
@onready var wary_ind: TextureRect = $HBoxContainer2/waryInd
@onready var danger_ind: TextureRect = $HBoxContainer2/dangerInd
@onready var high_ind: TextureRect = $HBoxContainer2/highInd
@onready var avoid_ind: TextureRect = $HBoxContainer2/avoidInd
@onready var threat_label: Label = $ThreatLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	safe_ind.visible = true
	wary_ind.visible = false
	danger_ind.visible = false
	high_ind.visible = false
	avoid_ind.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_threat_level(value: int):
	if value == 1:
		safe_ind.visible = true
	elif value == 2:
		wary_ind.visible = true
	elif value == 3:
		danger_ind.visible = true
	elif value == 4:
		high_ind.visible = true
	elif value == 5:
		avoid_ind.visible = true
	else:
		safe_ind.visible = false
		wary_ind.visible = false
		danger_ind.visible = false
		high_ind.visible = false
		avoid_ind.visible = false
		
