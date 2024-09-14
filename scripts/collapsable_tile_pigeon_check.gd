extends CharacterBody2D
@onready var ray_cast_down_long = $RayCastDownLong
@onready var ray_cast_down_short = $RayCastDownShort
@onready var pigeon = $"../MountainLevel/Pigeon"


var falling = false

func _process(delta):
	if ray_cast_down_long.is_colliding():
		var collider_rid = ray_cast_down_long.get_collider_rid()
		var pigeon_rid = pigeon.get_rid()
		var collider_shape = ray_cast_down_long.get_collider_shape()
		
		if collider_rid == pigeon.get_rid():
			falling = true

func _physics_process(delta):
	if falling and not ray_cast_down_short.is_colliding():
		position.y += 2.5
		
