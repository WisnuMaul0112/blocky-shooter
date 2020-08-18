extends Node2D

var b = Global.bullet
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	Bullet.text = "Bullet: " + str(b)

func _on_player_nembak():
	Bullet.text = "Bullet: " + str(Global.bullet)
	
func _on_portal_level_1():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = true
