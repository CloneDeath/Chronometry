extends "res://TimeObjects/BaseObject.gd"

signal go_to_next_level();

func unlock():
	if ($Sprite.frame < 16):
		emit_signal("go_to_next_level");
