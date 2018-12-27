extends Control

export var item_name = "unknown";
onready var inventory = get_node("/root/inventory");

func use_item_on(target):
	print(target);

func in_use():
	return inventory.current_item == self;

func get_clicked(event : InputEventMouseButton):
	var space_state = get_world_2d().direct_space_state;
	var result = space_state.intersect_point(event.position, 32, [], 0x7FFFFFFF, true, true);
	if (!result): return null;
	return result.front().collider;

func _input(event):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
		if (in_use()):
			var target = get_clicked(event);
			use_item_on(target);
			end_use();

func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton \
    	and event.button_index == BUTTON_LEFT \
    	and event.is_pressed():
        self.on_click()

func on_click():
	if (in_use()):
		end_use();
	else:
		start_use();

func start_use():
	Input.set_custom_mouse_cursor($ItemSprite.texture);
	$ItemSprite.visible = false;
	inventory.current_item = self;

func end_use():
	Input.set_custom_mouse_cursor(null);
	$ItemSprite.visible = true;
	inventory.current_item = null;