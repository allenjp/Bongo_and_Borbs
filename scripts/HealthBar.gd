extends AnimatedSprite2D
@onready var animation_player = $AnimationPlayer
@onready var health_bar = $"."
@onready var timer = $AnimationPlayer/Timer

func shake():
	animation_player.play("shake")
	timer.start()
	
func _on_timer_timeout():
	animation_player.stop()
