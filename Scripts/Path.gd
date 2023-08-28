extends Path2D

var timer = 0

var spawnTime = randi() % 6 + 2
var spawnTimeDecayFactor = 0.8
var minimumSpawnTime = 0.3

var tank = preload("res://Scenes/Entities/Enemy.tscn")

func _process(delta):
	timer += delta

	if timer > spawnTime:
		var newTank = tank.instance()
		add_child(newTank)
		timer = 0

		spawnTime = max(spawnTime * spawnTimeDecayFactor, minimumSpawnTime)
		spawnTime += randf() * 0.5
