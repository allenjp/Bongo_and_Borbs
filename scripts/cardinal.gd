extends Bird
@onready var animated_sprite = $AnimatedSprite2D
@onready var outer_area = $OuterArea
@onready var audio_stream_player = $AudioStreamPlayer2D

func _init():
	SPEED = 80
	direction = 1
	
func _ready():
	animated_sprite.flip_h = true

func _physics_process(delta):
	if moving:
		position.x += direction * SPEED * delta

func _on_outer_area_body_entered(body):
	audio_stream_player.play()
	moving = true
	toggle_eat(true)
	z_index = 2
	



func _on_outer_area_body_exited(body):
	audio_stream_player.stop()
