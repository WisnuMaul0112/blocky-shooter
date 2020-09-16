extends Node2D

var b = Global.bullet
var next_stage = "res://level/level2.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var menu = false
var stage = false
var dead = false
var paused = preload("res://menu/paused_panel.tscn")
onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_slide_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var player = $player
onready var colorreactblack = $CanvasLayer/ColorRect
onready var animasi_fade =$CanvasLayer/AnimationPlayer 
onready var animasi_slide_win= $CanvasLayer/popup/AnimationPlayer
onready var popup = $CanvasLayer/popup
onready var Bullet = $CanvasLayer/Label
onready var paused_panel = $CanvasLayer/paused_panel

func _ready():
	b = 10
	Bullet.text = "Bullet: " + str(b)
	popup.hide()
	popup_dead.hide()
	colorreactblack.hide()
	paused_panel.hide()

func _on_player_nembak():
	Bullet.text = "Bullet: " + str(Global.bullet)
	
func menang():
	popup.show()
	animasi_slide_win.play("slidepopup")
	get_tree().paused = true
	Global.level["level 2"] = true
	Global.save_file()
	
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
		get_tree().change_scene("res://menu/level.tscn")
		get_tree().paused = false
	elif menu == true:
		get_tree().change_scene(main_menu)
		get_tree().paused = false
	elif dead == true :
		get_tree().paused = false
		get_tree().reload_current_scene()
	
func dead():
	popup_dead.show()
	animasi_slide_dead.play("slidepopup")
	get_tree().paused = true
	
func retry():
	dead = true
	colorreactblack.show()
	animasi_fade.play("fade")
	
func _input(event):
	if event.is_action_pressed("exit"):
		paused_panel.show()
		get_tree().paused = true

func paused_panel_Continue():
	get_tree().paused = false
	paused_panel.hide()

func paused_panel_exit():
	main_menu()
