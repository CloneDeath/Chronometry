extends Control

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func on_click():
	print("clickclick");