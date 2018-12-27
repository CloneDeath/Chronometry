extends Node2D

var levels = [
	preload("res://Levels/Level01.tscn"),
	preload("res://Levels/Level02.tscn"),
	preload("res://Levels/YouWin.tscn")
];
var levelIndex = 0;

func _ready():
	print(levels);
	load_level();

func load_level():
	$LevelManager.clear_children()
	$LevelManager.load_level(levels[levelIndex].instance());
	$Gui.SetTime(0);

func go_to_next_level():
	levelIndex += 1;
	load_level();
