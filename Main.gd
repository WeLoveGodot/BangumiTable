extends Node

export(String) var SAVE_FILE = "user://bangumi.save"

func _ready():
	load_bangumi()

func _exit_tree():
	save_bangumi()

func load_bangumi():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_FILE):
		return

	save_file.open(SAVE_FILE, File.READ)
	var dict = parse_json(save_file.get_as_text())
	$UI.init_bangumi(dict)
	save_file.close()

func save_bangumi():
	var bangumis = $UI.get_bangumis()
	var save_file = File.new()
	save_file.open(SAVE_FILE, File.WRITE)
	save_file.store_string(to_json(bangumis))
	save_file.close()