extends Node2D

signal TimeChanged(value);

func SetTime(value):
	emit_signal("TimeChanged", value);
