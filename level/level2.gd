extends Node2D

var b = Global.bullet
var next_stage = "res://menu/level.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var stage = false
var menu = false
var dead = false

onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_popup_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var player = $player
onready var animasifade = $CanvasLayer/AnimationPlayer
onready var colorreactblack = $CanvasLayer/ColorRect
onready var popup = $CanvasLayer/popup_win
onready var animasi_popup_win = $CanvasLayer/popup_win/AnimationPlayer
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	popup.hide()
	popup_dead.hide()
	colorreactblack.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)
	
func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func menang():
	popup.show()
	animasi_popup_win.play("slidepopup")
	get_tree().paused = true

func main_menu():
	menu = true
	colorreactblack.show()
	animasifade.play("fade")

func next_stage():
	LevelUnlock.level3 = true
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
	elif dead == true :
		get_tree().reload_current_scene()
		get_tree().paused = false

func dead():
	popup_dead.show()
	animasi_popup_dead.play("slidepopup")
	get_tree().paused = true

func retry():
	dead = true
	colorreactblack.show()
	animasifade.play("fade")
