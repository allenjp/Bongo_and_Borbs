extends Area2D
@onready var bongo = $"../Bongo"

@onready var timer = $Timer

var respawn_point = "forest"

func _on_body_entered(body):
	print('you died!')
	timer.start()
	
func set_respawn_point(str):
	respawn_point = str

func _on_timer_timeout():
	if respawn_point == "forest":
		bongo.position.x = 0
		bongo.position.y = 0
	elif respawn_point == "desert":
		bongo.position.x = 1360
		bongo.position.y = -190
	elif respawn_point == "mountain":
		bongo.position.x = 3230
		bongo.position.y = -400
