extends KinematicBody2D

const MAX_SPEED = 30000
const MAX_FORCE = 0.02
var velocity = Vector2()
onready var target = get_position()

export (int, "SEEK", "FLEE") var mode = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	velocity = steer(target)
	move_and_slide(velocity * delta)
	target = get_viewport().get_mouse_position()

func steer(target):
	var desired_velocity = (target - get_position()).normalized() * MAX_SPEED
	if mode == 0:
		pass
	elif mode == 1:
		desired_velocity = -desired_velocity

	var steer = desired_velocity - velocity
	var target_velocity = velocity + (steer * MAX_FORCE)
	return target_velocity