extends KinematicBody2D

var motion = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	var player = get_parent().get_node("player")
	position += (player.position - position)/30
	move_and_slide(motion)

