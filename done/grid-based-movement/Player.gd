extends KinematicBody2D

var direction = Vector2()

var type
var grid

var is_moving = false
var target_position = Vector2()
var target_direction = Vector2()

var speed = 0
const MAX_SPEED = 25000

var velocity = Vector2()

func _ready():
	grid = get_parent()
	type = grid.ENTITY_TYPES.PLAYER


func _physics_process(delta):	
	direction = Vector2()
	
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	elif Input.is_action_pressed("move_down"):
		direction.y = 1
	elif Input.is_action_pressed("move_left"):
		direction.x = -1
	elif Input.is_action_pressed("move_right"):
		direction.x = 1
	
	if not is_moving and direction != Vector2():
		target_direction = direction
		if grid.is_cell_vacant(get_position(), target_direction):
			target_position = grid.update_child_position(self)
			print(target_direction)
			is_moving = true
	
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed * target_direction * delta
		
		var position = get_position()
		var distance_to_target = Vector2(abs(target_position.x - position.x), abs(target_position.y - position.y))

		if abs(velocity.x) > distance_to_target.x:
			velocity.x = distance_to_target.x * target_direction.x
			is_moving = false
		if abs(velocity.y) > distance_to_target.y:
			velocity.y = distance_to_target.y * target_direction.y
			is_moving = false

		move_and_slide(velocity)
