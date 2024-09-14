extends Node
@onready var animation_player = $"../ForestLevel/Platform/AnimationPlayer"
@onready var killzone = $"../Killzone"

var score = 0;

func add_score():
	score += 1
	
	if (score == 2):
		animation_player.play("move")

	if (score == 3):
		killzone.set_respawn_point("desert")
	
	if (score == 4):
		killzone.set_respawn_point("mountain")
		
	print(score)
