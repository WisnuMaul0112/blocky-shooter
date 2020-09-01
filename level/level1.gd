extends Node2D

var b = Global.bullet
var next_stage = "res://level/level2.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var menu = false
var stage = false
onready var player = $player
onready var colorreactblack = $CanvasLayer/ColorRect
onready var animasi_fade =$AnimationPlayer 
onready var popup = $CanvasLayer/popup
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 10
	Bullet.text = "Bullet: " + str(b)
	popup.hide()
	colorreactblack.hide()

func _on_player_nembak():
	Bullet.text = "Bullet: " + str(Global.bullet)
	
func menang():
	popup.show()
	var menang = $CanvasLayer/popup/AnimationPlayer
	menang.play("slidepopup")
	player.queue_free()


func _on_popup_next_stage():
	stage = true
	animasi_fade.play("fade")
	colorreactblack.show()
	#unused
	#get_tree().change_scene(next_stage)

func _on_popup_main_menu():
	menu = true
	animasi_fade.play("fade")
	colorreactblack.show()
	#unused
	#get_tree().change_scene(main_menu)


func animasi_fade(anim_name):
	if menu == true:
		get_tree().change_scene(main_menu)
	elif stage == true:
		get_tree().change_scene(next_stage)
