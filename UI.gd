extends Control

onready var bangumis = find_node("Bangumis")
onready var add_btn = find_node("AddBtn")
onready var edit = find_node("LineEdit")

func _ready():
	add_btn.connect("pressed", self, "add_bangumi")

func init_bangumi(dict):
	bangumis.init(dict["bangumis"])

func get_bangumis():
	return {
		"bangumis": bangumis.get_bangumis()
	}

func add_bangumi():
	var bangumi_name = edit.text
	print("add", bangumi_name)
	bangumis.try_add(bangumi_name)
