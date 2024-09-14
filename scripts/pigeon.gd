extends Bird
@onready var ray_cast_down = $RayCastDown
@onready var collision_object = $CollisionObject
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

func _init():
	SPEED = 100
	direction = 1

func _process(delta):
	if moving:
		position.x += direction * SPEED * delta
		
	if not ray_cast_down.is_colliding():
		position.y += gravity * delta * 0.15

	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true

func _on_outer_area_body_entered(body):
	print("near pigeon")
	z_index = 2
	moving = true
	toggle_eat(true)

