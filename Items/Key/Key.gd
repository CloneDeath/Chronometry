extends "res://Items/BaseItem.gd"

func use_item_on(item):
	.use_item_on(item);
	if (item.has_method("unlock")):
		if (item.unlock()):
			self.queue_free();