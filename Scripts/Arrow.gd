extends KinematicBody2D

var new_velocity = Vector2()
var damage_amount = 10

func shoot(direction):
	new_velocity = direction

func _physics_process(delta):
	var collision_info = move_and_collide(new_velocity * delta)
	if collision_info:
		var enemy = collision_info.get_collider()
		if enemy.is_in_group("enemies"):
			#enemy.take_damage(damage_amount)
			queue_free()
