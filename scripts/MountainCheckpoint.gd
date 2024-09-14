extends Area2D

@onready var killzone = $"../../Killzone"


func _on_body_entered(body):
	killzone.set_respawn_point("mountain")
