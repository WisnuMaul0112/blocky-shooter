extends Node2D

var b = Global.bullet
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	Bullet.text = "Bullet" + str(b)

func _on_player_nembak():
	Bullet.text = "Bullet: " + str(Global.bullet)
	

