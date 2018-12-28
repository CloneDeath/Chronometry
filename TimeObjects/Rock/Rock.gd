extends "res://TimeObjects/BaseObject.gd"
const Rock = preload("res://Items/Rock/Rock.tscn");

var taken = null;

signal ItemAdded(item);

func _process(_delta):
	$Sprite.visible = rock_exists();

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func rock_exists():
	return taken == null || current_time < taken;

func on_click():
	if (rock_exists()):
		taken = current_time;
		var keyItem = Rock.instance();
		emit_signal("ItemAdded", keyItem);