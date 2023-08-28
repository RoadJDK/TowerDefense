extends PathFollow2D

var speed = 100

func _process(delta):
	offset += speed * delta
	
	if (loop == false and unit_offset == 1):
		queue_free()
