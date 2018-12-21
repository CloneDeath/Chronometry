extends "res://TimeObjects/BaseObject.gd"

var taken = null;

func _process(delta):
	$Sprite.visible = taken == null || current_time < taken;
	$Ice.visible = !$Sprite.visible;
	$Ice.frame = $Sprite.frame;


func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func on_click():
	if ($Sprite.frame >= 15):
		taken = current_time;
