extends Node2D

onready var window_size = OS.get_window_size()
onready var player_world_position = get_player_grid_position()

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = player_world_position * window_size
	get_viewport().set_canvas_transform(canvas_transform)

func get_player_grid_position():
	# Converts theplayer position in px to current position on world grid.
	var position = $Player.get_position() - $Player/Sprite.texture.get_size() / 2
	var x = floor(position.x / window_size.x)
	var y = floor(position.y / window_size.y)
	return Vector2(x, y)

func update_camera():
	var new_player_grid_position = get_player_grid_position()
	var transform = Transform2D()

	if new_player_grid_position != player_world_position:
		player_world_position = new_player_grid_position
		transform = get_viewport().get_canvas_transform()
		transform[2] = -player_world_position * window_size
		get_viewport().set_canvas_transform(transform)

	return transform