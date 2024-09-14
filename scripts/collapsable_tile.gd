extends CharacterBody2D
@onready var ray_cast_up = $RayCastUp
@onready var ray_cast_down = $RayCastDown

var falling = false

func _process(delta):
	if ray_cast_up.is_colliding():
		await get_tree().create_timer(0.3).timeout
		move_tile()

func move_tile():
	falling = true

func _physics_process(delta):
	if falling and not ray_cast_down.is_colliding():
		position.y += 3
