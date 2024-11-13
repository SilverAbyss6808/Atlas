extends Node

var prevscene = ""
var currentLevel = ""
var save_path = "res://saves/variable.save"
var loading = false
var skill_info = "Skill Info: "
var player_x = 0
var player_y = 0

#variables for cooldowns of skills, skill name comment by index is by the set function
var tach_speed_cooldowns = [10,0]
var tach_slow_cooldowns = [5,0]
var nano_attack_cooldowns = [.5, 0]
var nano_buff_cooldowns = [0,0]
var current_skill_in_tree = ""
var unlock_flag = false
# Called when the node enters the scene tree for the first time.
func set_prevscene (value):
	prevscene = value

func set_currentLevel (value):
	currentLevel = value
func save_game():
	var save_file = FileAccess.open(Global.save_path, FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")
		var json_string = JSON.stringify(node_data)
		save_file.store_line(json_string)
func load_game():
	if not FileAccess.file_exists(Global.save_path):
		return # Error! We don't have a save to load.
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for i in save_nodes:
		i.queue_free()

	# Load the file line by line and process that dictionary to restore
	# the object it represents.
	var save_file = FileAccess.open(Global.save_path, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		# Creates the helper class to interact with JSON.
		var json = JSON.new()

		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		# Get the data from the JSON object.
		var node_data = json.data

		# Firstly, we need to create the object and add it to the tree and set its position.
		var new_object = load(node_data["filename"]).instantiate()
		get_node(node_data["parent"]).add_child(new_object)
		if (node_data["filename"] != "res://Scenes and scripts/Menus/ui.tscn"):
			new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_skill_info(value: String):
	skill_info = value
#tachspeed skill order: tach_boost
#tachslow skill order:
#nanoattack skill order: nano_claw
#nanobuff skill order:
func set_skill_cooldown(type: String, index: int, value):
	if type == "tachspeed":
		tach_speed_cooldowns[index] = value
	elif type == "tachslow":
		tach_slow_cooldowns[index] = value
	elif type == "nanoattack":
		nano_attack_cooldowns[index] = value
	elif type == "nanobuff":
		nano_buff_cooldowns[index] = value
