extends Panel

onready var name_label = find_node("Name")
onready var count_label = find_node("Count")
onready var add_btn = find_node("AddBtn")
onready var del_btn = find_node("DeleteBtn")

signal add_one(name)
signal deleted(name)

func _ready():
	add_btn.connect("pressed", self, "add_one")
	del_btn.connect("pressed", self, "delete_me")


func init(name, count):
	name_label.text = name
	count_label.text = String(count)

func add_one():
	count_label.text = String(int(count_label.text) + 1)
	emit_signal("add_one", name_label.text)

func delete_me():
	emit_signal("deleted", name_label.text)
	add_btn.disconnect("pressed", self, "add_one")
	del_btn.disconnect("pressed", self, "delete_me")
	queue_free()