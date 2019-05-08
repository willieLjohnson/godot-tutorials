extends Node2D

onready var screen_size = OS.get_window_size()
onready var player = $Player

func _ready():
	update_camera()

	
func update_camera():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = - last_player_position + screen_size / 2
	get_viewport().set_canvas_transform(canvas_transform)
