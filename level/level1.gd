extends Node2D

var b = Global.bullet
var next_stage = "res://level/level2.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
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


func _on_popup_next_stage():
	get_tree().change_scene(next_stage)

func _on_popup_main_menu():
	get_tree().change_scene(main_menu)
