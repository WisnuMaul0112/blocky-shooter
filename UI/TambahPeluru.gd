extends Node2D

signal isi_peluru
onready var animasi = $AnimationPlayer

func _ready():
	animasi.play("peluru")
	pass 
	
func _on_Area2D_body_entered(body):
	emit_signal("isi_peluru")
	if "player" in body.name:
		Music.get_item.play()
		queue_free()
	pass 
