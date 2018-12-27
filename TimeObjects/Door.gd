extends "res://TimeObjects/BaseObject.gd"

onready var inventory = get_node("/root/inventory");

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
		clicked();

func clicked():
	if (inventory.current_item_name == "key"):
		print("unlocked! you win!");
