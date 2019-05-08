extends Node2D

onready var screen_size = Vector2(ProjectSettings.get("display/window/size/width"), ProjectSettings.get("display/window/size/height"))

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	canvas_transform[2] = - $Player.get_position() + screen_size / 2
	get_viewport().set_canvas_transform(canvas_transform)

func update_camera():
	print("update camera")
