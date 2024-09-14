extends Bird
	
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_down = $RayCastDown
@onready var ray_cast_left = $RayCastLeft

var robin = Bird.new()

func _init():
	SPEED = 150
	direction = -1

func _process(delta):
	if not ray_cast_down.is_colliding():
		position.y += gravity * delta * 0.15
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true

	if moving:
		position.x += direction * SPEED * delta
