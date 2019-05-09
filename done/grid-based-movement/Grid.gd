extends TileMap

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

enum ENTITY_TYPES {PLAYER, OBSTACLE, COLLECTIBLE}

var grid_size = Vector2(16, 16)
var grid = []

onready var Obstacle = preload("res://Obstacle.tscn")


func _ready():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)

	var positions = []
	for n in range(5):
		var grid_position = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y))
		if not grid_position in positions:
			positions.append(grid_position)
	
			for position in positions:
				var new_obstacle = Obstacle.instance()
				new_obstacle.set_position(map_to_world(position) + half_tile_size)
				grid[position.x][position.y] = ENTITY_TYPES.OBSTACLE
				add_child(new_obstacle)


func is_cell_vacant():
	# Return true if the cell is vacant, else false
	pass


func update_child_pos(child, new_pos, direction):
	# Move a child to a new position in the grid Array
	# Returns the new target world position of the child
	pass
