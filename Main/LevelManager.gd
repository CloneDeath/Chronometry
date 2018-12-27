extends Node2D

var current_level = null;

signal ItemAdded(item);
func AddItem(item):
	emit_signal("ItemAdded", item);

signal go_to_next_level;
func go_to_next_level():
	emit_signal("go_to_next_level");

func clear_children():
	for child in get_children():
		child.queue_free();

func load_level(level):
	current_level = level;
	add_child(level);
	level.connect("ItemAdded", self, "AddItem")
	level.connect("go_to_next_level", self, "go_to_next_level");

func TimeChanged(value):
	current_level.SetTime(value);