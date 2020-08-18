extends Area2D

export (int) var speed
func _ready():
	pass 

func _physics_process(delta):
	position += transform.x *speed * delta
	
func _on_Timer_timeout():
	queue_free()

func _on_bullet_body_entered(body):
	if body.is_in_group("enemy"):
		body.queue_free()
	queue_free()
