extends Node2D

onready var screen_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))
onready var player = $Player
onready var last_player_position = player.get_position()

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = - last_player_position + screen_size / 2
	get_viewport().set_canvas_transform(canvas_transform)

func update_camera():
	var player_offset = last_player_position - player.get_position()
	last_player_position = player.get_position()

	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] += player_offset
	get_viewport().set_canvas_transform(canvas_transform)

	return player_offset