extends Bird

func _init():
	SPEED = 80
	direction = 1
	frequency = 5
	amplitude = 50
	
var time = 0

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.flip_h = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
		
func _physics_process(delta):
	time += delta
	var movement = cos(time*frequency) * amplitude

	if moving:
		position.x += direction * SPEED * delta
		position.y += movement * delta
