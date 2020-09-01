extends Node2D

var b = Global.bullet
var next_stage = "res://level/level3.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var stage = false
var menu = false
onready var player = $player
onready var animasifade = $CanvasLayer/AnimationPlayer
onready var colorreactblack = $CanvasLayer/ColorRect
onready var popup = $CanvasLayer/popup_win
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	popup.hide()
	colorreactblack.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)
	
func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func menang():
	popup.show()
	var menang = $CanvasLayer/popup_win/AnimationPlayer
	menang.play("slidepopup")
	get_tree().paused = true

func _on_popup_win_main_menu():
	menu = true
	colorreactblack.show()
	animasifade.play("fade")

func _on_popup_win_next_stage():
	stage = true
	colorreactblack.show()
	animasifade.play("fade")
	
func animasi_finish(anim_name):
	if menu == true :
		get_tree().change_scene(main_menu)
		get_tree().paused = false
	elif stage == true:
		get_tree().change_scene(next_stage)
		get_tree().paused = false
