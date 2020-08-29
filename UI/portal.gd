extends Node2D

signal menang

func _on_Area2D_body_entered(body):
	if "player" in body.name:
		#get_tree().reload_current_scene()
		emit_signal("menang")
