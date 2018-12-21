extends Node2D

export(float) var Minimum = 0;
export(float) var Maximum = 1;

func SetTime(value):
	var valueRange = Maximum - Minimum;
	var progress = ((value - Minimum) / valueRange);
	progress = clamp(progress, 0, 1);
	$Sprite.frame = (progress * ($Sprite.hframes - 1));