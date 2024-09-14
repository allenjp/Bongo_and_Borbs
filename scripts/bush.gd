extends Area2D

@onready var robin = $"../Robin"

func _on_body_entered(body):
	if is_instance_valid(robin):
		robin.start_stop_moving(true)
		robin.z_index = 2
		await get_tree().create_timer(0.4).timeout
		robin.toggle_eat(true)
