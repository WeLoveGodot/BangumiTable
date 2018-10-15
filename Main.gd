extends Node

export(String) var SAVE_FILE = "user://bangumi.save"

func _ready():
	load_bangumi()

func _exit_tree():
	# save_bangumi()
	pass

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_bangumi()
		pass
	elif what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		save_bangumi()
		pass
	elif what == MainLoop.NOTIFICATION_WM_FOCUS_OUT:
		save_bangumi()
		pass
	# get_tree().quit()

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