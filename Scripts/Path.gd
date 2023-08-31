extends Path2D

var timer = 0

var spawnTime = 6
var spawnTimeDecayFactor = 0.8

var tank = preload("res://Scenes/Entities/Enemy.tscn")

func _process(delta):
	timer += delta

	if timer > spawnTime:
		var newTank = tank.instance()
		add_child(newTank)
		timer = 0
		
		spawnTime = spawnTime * spawnTimeDecayFactor
