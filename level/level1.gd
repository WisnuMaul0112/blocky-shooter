extends Node2D

var b = Global.bullet
var next_stage = "res://level/level2.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var menu = false
var stage = false
onready var player = $player
onready var colorreactblack = $CanvasLayer/ColorRect
onready var animasi_fade =$CanvasLayer/AnimationPlayer 
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
	get_tree().paused = true
	
func main_menu():
	menu = true
	colorreactblack.show()
	animasi_fade.play("fade")
	
func next_stage():
	stage = true
	colorreactblack.show()
	animasi_fade.play("fade")
	
func animasi_finish(anim_name):
	if stage == true:
		get_tree().change_scene(next_stage)
		get_tree().paused = false
	elif menu == true:
		get_tree().change_scene(main_menu)
		get_tree().paused = false
