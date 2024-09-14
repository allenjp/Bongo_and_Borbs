extends Area2D

class_name Bird

var SPEED: float
var direction: int
var moving: bool
var can_be_eaten: bool
var frequency: float
var amplitude: float

@onready var game_manager = %GameManager

func start_stop_moving(boolean):
	moving = boolean
	
func toggle_eat(boolean):
	can_be_eaten = boolean

func _on_body_entered(body):
	if can_be_eaten:
		queue_free()
		game_manager.add_score()
		print(game_manager.score)
