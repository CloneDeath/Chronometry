extends Node2D

signal TimeChanged(value);
signal ItemAdded(value);

func SetTime(value):
	emit_signal("TimeChanged", value);

func AddItem(value):
	emit_signal("ItemAdded", value);
