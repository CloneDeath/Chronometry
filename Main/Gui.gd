extends Container

signal TimeChanged(value);

func AddItem(item):
	$Panel/Items.add_child(item);

func _on_HSlider_value_changed(value):
	emit_signal("TimeChanged", value);
