extends "res://TimeObjects/BaseObject.gd"

var locked : bool setget set_locked,get_locked;
var open_time = null;

func SetTime(value):
	.SetTime(value);
	$Key.frame = $Sprite.frame;
	self.locked = open_time == null || current_time < open_time;

func set_locked(value):
	$Key.visible = !value;

func get_locked():
	return !$Key.visible;

func unlock():
	open_time = current_time;