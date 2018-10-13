extends VBoxContainer

var bangumis = []
export(PackedScene) var list_item = null

func _ready():
	pass	

func init(dict):
	bangumis = dict
	init_list()

func find(name):
	for bangumi in bangumis:
		if bangumi["name"] == name:
			return bangumi
	return null

func try_add(name):
	if find(name) != null:
		print("exists")
	else:
		var bangumi = {
			"name": name,
			"count": 1,
		}
		bangumis.append(bangumi)
		spawn_list_item(bangumi)


func get_bangumis():
	return bangumis

func init_list():
	for bangumi in bangumis:
		spawn_list_item(bangumi)

func spawn_list_item(bangumi):
		var new_item = list_item.instance()
		add_child(new_item)
		new_item.init(bangumi["name"], bangumi["count"])
		new_item.connect("add_one", self, "on_item_add")
		new_item.connect("deleted", self, "on_item_deleted")


func on_item_add(name):
	var bangumi = find(name)
	if bangumi != null:
		bangumi["count"] += 1

func on_item_deleted(name):
	var bangumi = find(name)
	if bangumi != null:
		bangumis.erase(bangumi)