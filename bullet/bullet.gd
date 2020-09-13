extends Area2D

export (int) var speed
onready var monster_death_music = $AudioStreamPlayer
var monster_death

func _ready():
	pass 

func _physics_process(delta):
	position += transform.x *speed * delta
	
func _on_Timer_timeout():
	queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group("enemy"):
		Music.moster_death.play()
		body.queue_free()
	queue_free()
