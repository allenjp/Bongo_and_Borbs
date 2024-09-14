extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var health_bar = $"../CanvasLayer/HealthBar"
@onready var move_timer = $MoveTimer
@onready var forest_tiles = $"../ForestLevel/ForestTiles"
@onready var desert_tiles = $"../DesertLevel/DesertTiles"
@onready var mountain_tiles = $"../MountainLevel/MountainTiles"
@onready var dig_timer = $DigTimer
@onready var gila = $"../DesertLevel/Gila"
@onready var gila_animation_player = $"../DesertLevel/Gila/AnimationPlayer"
@onready var gila_sprite = $"../DesertLevel/Gila/AnimatedSprite2D"

const SPEED = 12000.0
const JUMP_VELOCITY = -370.0
var max_health = 9
var current_health = max_health
var can_move = true
var can_doublejump = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
	# Start at Desert Level
	#position.x = 1360
	#position.y = -190
	
	#start at mountain level
	#position.x=2850
	#position.y=100

func take_damage(amount):
	current_health -= amount
	
	print(current_health)
	
	if current_health < 0:
		current_health = 0
		print("you died!")

	health_bar.set_frame(current_health)
	health_bar.shake()
	
func bounce_off():
	can_move = false
	
	move_timer.start()
	
	if animated_sprite.flip_h:
		velocity.x = 160
	else:
		velocity.x = -160
		
	animated_sprite.play("ouch")
		
	move_and_slide()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		can_doublejump = true
		velocity.y = JUMP_VELOCITY
		
	elif Input.is_action_just_pressed("ui_accept") and !is_on_floor() and can_doublejump:
		can_doublejump = false
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if can_move:
		if direction:
			velocity.x = direction * SPEED * delta
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	move_and_slide()
	
	var bongo_position = global_position
	
	var bongo_position_tile_map_desert = desert_tiles.to_local(bongo_position)
	var bongo_cell_coords_desert = desert_tiles.local_to_map(bongo_position_tile_map_desert)
	var tile_map_id_desert = desert_tiles.get_cell_source_id(1, bongo_cell_coords_desert)
	var tile_atlas_coords_desert = desert_tiles.get_cell_atlas_coords(1, bongo_cell_coords_desert)

	if Input.is_action_just_pressed("dig"):
		print("digging!")
		
		animated_sprite.play("dig")
		
		dig_timer.start()
		
		if tile_map_id_desert == 2 and tile_atlas_coords_desert == Vector2i(4, 2):
			print("on diggable tile")
			desert_tiles.erase_cell(1, bongo_cell_coords_desert)
			
			gila_animation_player.play("fly_up")
	if not animated_sprite.is_playing():
		animated_sprite.play("walk_idle")

func _on_move_timer_timeout():
	can_move = true

func _on_dig_timer_timeout():
	animated_sprite.stop()


func _on_animation_player_animation_finished(fly_up):
	print("done flying up")
	gila_sprite.flip_h = true
	gila.start_stop_moving(true)
