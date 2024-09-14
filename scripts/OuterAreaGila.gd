extends Area2D
@onready var audio_player = $"../AudioStreamPlayer2D"

func _on_body_entered(body):
	audio_player.play(1.2)


func _on_body_exited(body):
	audio_player.stop()
