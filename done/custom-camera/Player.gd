extends KinematicBody2D

var direction = Vector2()
var speed = 0
var velocity = Vector2()
const MAX_SPEED = 20000


enum Direction {TOP, RIGHT, DOWN, LEFT}
signal move

func _ready():
	pass

func _physics_process(delta):
	var is_moving = Input.is_action_pressed("move_down") or Input.is_action_pressed("move_up") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right")
	if is_moving:
		speed = MAX_SPEED

		if Input.is_action_pressed("move_right"):
			turn_towards(Direction.RIGHT)
		elif Input.is_action_pressed("move_left"):
			turn_towards(Direction.LEFT)
		elif Input.is_action_pressed("move_up"):
			turn_towards(Direction.TOP)
		elif Input.is_action_pressed("move_down"):
			turn_towards(Direction.DOWN)
	else:
		speed = 0
	
	velocity = speed * direction * delta
	move_and_slide(velocity)
	if is_moving:
		emit_signal("move")


func turn_towards(_direction):
	if _direction == Direction.TOP:
		direction = Vector2(0, -1)
	elif _direction == Direction.DOWN:
		direction = Vector2(0, 1)
	elif _direction == Direction.LEFT:
		direction = Vector2(-1, 0)
		get_node("Sprite").set_flip_h(false)
	elif _direction == Direction.RIGHT:
		direction = Vector2(1, 0)
		get_node("Sprite").set_flip_h(true)
	