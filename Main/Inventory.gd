extends Node

var current_item = null;
var current_item_name setget ,get_current_item_name

func get_current_item_name():
	if (current_item == null):
		return "none";
	return current_item.item_name;
