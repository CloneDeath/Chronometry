extends "res://TimeObjects/BaseObject.gd"

const Key = preload("res://Items/Key.tscn");

var taken = null;

signal ItemAdded(item);

func _process(_delta):
	$Sprite.visible = key_exists();
	$Ice.visible = !$Sprite.visible;
	$Ice.frame = $Sprite.frame;

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func key_exists():
	return taken == null || current_time < taken;

func on_click():
	if ($Sprite.frame >= 15 && key_exists()):
		taken = current_time;
		var keyItem = Key.instance();
		emit_signal("ItemAdded", keyItem);
