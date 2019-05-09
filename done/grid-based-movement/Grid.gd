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


func is_cell_vacant(position, direction):
	var grid_position = world_to_map(position) + direction

	if grid_position.x < grid_size.x and grid_position.x >= 0:
		if grid_position.y < grid_size.y and grid_position.y >= 0:
			return grid[grid_position.x][grid_position.y] == null
	return false


func update_child_position(child):
	var grid_position = world_to_map(child.get_position())
	print(grid_position)
	grid[grid_position.x][grid_position.y] = null

	var new_grid_position = grid_position + child.direction
	grid[new_grid_position.x][new_grid_position.y] = child.type

	var target_position = map_to_world(new_grid_position) + half_tile_size
	return target_position