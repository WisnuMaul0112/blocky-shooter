extends Node2D

var b = Global.bullet
onready var popup = $CanvasLayer/popup
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	Bullet.text = "Bullet: " + str(b)
	popup.hide()

func _on_player_nembak():
	Bullet.text = "Bullet: " + str(Global.bullet)
	
func menang():
	popup.show()
	var menang = $CanvasLayer/popup/AnimationPlayer
	menang.play("slidepopup")
