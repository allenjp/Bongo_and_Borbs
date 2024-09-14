extends Bird

func _init():
	SPEED = 80
	direction = 1
	
var time = 0

@onready var animated_sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	can_be_eaten = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if moving:
		position.x += direction * SPEED * delta
