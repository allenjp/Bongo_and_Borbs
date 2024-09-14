extends Area2D
@onready var bluejay = $".."
@onready var audio_player = $"../AudioStreamPlayer2D"

func _on_body_entered(body):
	audio_player.play(0.13)
	
	if is_instance_valid(bluejay):
		bluejay.start_stop_moving(true)
		bluejay.z_index = 2
		await get_tree().create_timer(0.6).timeout
		bluejay.toggle_eat(true)
		
func _on_body_exited(body):
	audio_player.stop()
