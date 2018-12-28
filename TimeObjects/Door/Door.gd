extends "res://TimeObjects/BaseObject.gd"

export(Array, NodePath) var lock_paths = [
	NodePath("Lock")
];

signal go_to_next_level();

func _ready():
	for path in lock_paths:
		var lock = get_node(path);
		lock.Minimum = self.Minimum;
		lock.Maximum = self.Maximum;

func SetTime(value):
	.SetTime(value);
	for path in lock_paths:
		var lock = get_node(path);
		lock.SetTime(value);

func all_locks_are_open():
	for path in lock_paths:
		var lock = get_node(path);
		if (lock.locked):
			return false;
	return true;

func set_lock_visibility(visibility):
	for path in lock_paths:
		var lock = get_node(path);
		lock.visible = visibility;

func _process(_delta):
	update_door_state();

func update_door_state():
	if (all_locks_are_open()):
		set_lock_visibility(false);
		$DoorOpen.visible = true;
	else:
		set_lock_visibility(true);
		$DoorOpen.visible = false;

func unlock():
	var locked = false;
	for path in lock_paths:
		var lock = get_node(path);
		if (lock.locked):
			update_door_state();
			locked = lock.unlock();
	return locked;

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func on_click():
	if (all_locks_are_open()):
		emit_signal("go_to_next_level");