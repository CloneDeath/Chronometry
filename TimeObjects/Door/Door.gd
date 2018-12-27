extends "res://TimeObjects/BaseObject.gd"

export(Array, NodePath) var lock_paths = [
	NodePath("Lock")
];

signal go_to_next_level();

func _ready():
	for path in lock_paths:
		var lock = get_node(path);
		lock.Minimum = self.Minimum;
		lock.Maximum = self.Maximum;

func SetTime(value):
	.SetTime(value);
	for path in lock_paths:
		var lock = get_node(path);
		lock.SetTime(value);

func unlock():
	if ($Sprite.frame < 16):
		emit_signal("go_to_next_level");
		return true;
	return false;
