extends Node2D

onready var window_size = OS.get_window_size()
onready var player = $Player
onready var player_world_position = get_player_world_position()

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = player_world_position * window_size
	get_viewport().set_canvas_transform(canvas_transform)

func get_player_grid_position():
	# Converts theplayer position in px to current position on world grid.
	pass

func update_camera():
	pass