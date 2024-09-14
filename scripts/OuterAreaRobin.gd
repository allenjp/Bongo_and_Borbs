extends Area2D

@onready var audio_player = $"../AudioStreamPlayer2D"

func _on_body_entered(body):
	print("near bird")
	audio_player.play()

func _on_body_exited(body):
	print("left bird area")
	audio_player.stop()
