extends Node2D

var tower_scene = preload("res://Scenes/Entities/Turret.tscn")

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_RIGHT and event.pressed:
		place_tower(event.global_position)


func place_tower(position):
	var local_pos = $TileMap.world_to_map(position)

	if $TileMap.get_cell(local_pos.x, local_pos.y) == 0 and not is_tower_at_position($TileMap.map_to_world(local_pos)):
		var tower_instance = tower_scene.instance()
		tower_instance.global_position = $TileMap.map_to_world(local_pos) + $TileMap.cell_size * 0.5
		add_child(tower_instance)

func is_tower_at_position(world_pos):
	var towers = get_tree().get_nodes_in_group("towers")
	
	var targeted_cell_pos = $TileMap.world_to_map(world_pos)
	
	for tower in towers:
		if $TileMap.world_to_map(tower.global_position) == targeted_cell_pos:
			return true
		
		var half_diagonal = $TileMap.cell_size.length() * 0.5
		if tower.global_position.distance_to(world_pos) < half_diagonal:
			return true
	
	return false
