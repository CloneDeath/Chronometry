extends Node2D

signal TimeChanged(value);
signal ItemAdded(value);
signal go_to_next_level();

func SetTime(value):
	emit_signal("TimeChanged", value);

func AddItem(value):
	emit_signal("ItemAdded", value);

func go_to_next_level():
	emit_signal("go_to_next_level");
