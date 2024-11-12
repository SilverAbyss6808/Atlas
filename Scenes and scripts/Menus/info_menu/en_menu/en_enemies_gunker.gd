extends HSplitContainer

@onready var threat_indicator: VBoxContainer = $VBoxContainer/ThreatIndicator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	threat_indicator.set_threat_level(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
