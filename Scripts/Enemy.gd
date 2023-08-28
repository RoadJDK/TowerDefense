extends KinematicBody2D

var max_health = 100
var current_health = 100

func take_damage(damage):
	current_health -= damage
	update_health_bar()
	if current_health <= 0:
		die()

func die():
	queue_free()

func update_health_bar():
	var health_percentage = float(current_health) / float(max_health)
	$Healthbar/Background/Bar.rect_scale.y = health_percentage
