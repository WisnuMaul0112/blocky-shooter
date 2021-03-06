extends Node2D

var b = Global.bullet
var next_stage = "res://level/level2.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var menu = false
var stage = false
var dead = false
onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_slide_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var player = $player
onready var colorreactblack = $CanvasLayer/ColorRect
onready var animasi_fade =$CanvasLayer/AnimationPlayer 
onready var animasi_slide_win= $CanvasLayer/popup/AnimationPlayer
onready var popup = $CanvasLayer/popup
onready var Bullet_label = $CanvasLayer/Label
onready var paused = $CanvasLayer/paused
onready var heart = $CanvasLayer/Heart_Bar

func _ready():
	b = 10
	Bullet_label.text = "Bullet: " + str(b)
	popup.hide()
	popup_dead.hide()
	colorreactblack.hide()
	paused.hide()

func _on_player_nembak():
	Bullet_label.text = "Bullet: " + str(Global.bullet)
	
func menang():
	popup.show()
	animasi_slide_win.play("slidepopup")
	get_tree().paused = true
	Global.level["level 2"] = true
	Global.save_file()
	heart.hide()
	Bullet_label.hide()
	
func main_menu():
	menu = true
	colorreactblack.show()
	paused.hide()
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
	heart.hide()
	Bullet_label.hide()
	
func retry():
	dead = true
	colorreactblack.show()
	animasi_fade.play("fade")

func Continue():
	get_tree().paused = false
	paused.hide()

func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().paused = true
		paused.show()
