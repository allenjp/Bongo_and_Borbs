extends Area2D

@onready var game_manager = %GameManager
@onready var bongo = $"../../Bongo"

func _on_body_entered(body):
	bongo.take_damage(1)
	bongo.bounce_off()
