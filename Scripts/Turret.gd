extends AnimatedSprite

var new_range = 200
var attack_delay = 1
var last_attack_time = 0.0

var projectile_scene = preload("res://Scenes/Entities/Arrow.tscn")
var projectile_speed = 700

func _ready():
	set_process_input(true)

func attack_enemy(enemy):
	var direction = enemy.global_position - global_position
	shoot(direction)

func _process(delta):
	last_attack_time += delta
	
	var closest_enemy = null
	var closest_distance = new_range
	for enemy in get_tree().get_nodes_in_group("enemies"):
		var distance = enemy.global_position.distance_to(global_position)
		if distance <= new_range and distance < closest_distance:
			closest_distance = distance
			closest_enemy = enemy

	if last_attack_time >= attack_delay:
		if closest_enemy:
			attack_enemy(closest_enemy)
			last_attack_time = 0.0

func shoot(direction):
	var projectile = projectile_scene.instance()
	get_parent().add_child(projectile)
	projectile.global_position = self.global_position

	var angle_to_target = atan2(direction.y, direction.x)
	projectile.rotation = angle_to_target
	projectile.rotation += deg2rad(90)

	projectile.shoot(direction.normalized() * projectile_speed)
	

func _on_Area_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		queue_free()
