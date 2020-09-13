extends Node2D

export var jumlah_spawn = 1
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet
var main_menu = "res://menu/HomeScreen.tscn"
var next_stage = "res://menu/level.tscn"
var stage = false
var menu = false
var dead = false

onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_popop_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var player = $player
onready var animasifade = $CanvasLayer/AnimationPlayer
onready var colorreactblack = $CanvasLayer/ColorRect
onready var popup = $CanvasLayer/popup_win
onready var animasi_popup_win = $CanvasLayer/popup_win/AnimationPlayer
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	colorreactblack.hide()
	popup.hide()
	popup_dead.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)

func spawn():
	for i in range(jumlah_spawn):
		var musuh_muncul = musuh.instance()
		musuh_muncul.position.x = rand_range(1476.224, -264.539)
		musuh_muncul.position.y = rand_range(155.086, 562.946)
		add_child(musuh_muncul)

func _on_spawn_musuh_timeout():
	spawn()
	pass

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)

func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func menang():
	popup.show()
	animasi_popup_win.play("slidepopup")
	get_tree().paused = true
	Global.level["level 4"] = true
	Global.save_file()
	
func main_menu():
	menu = true
	colorreactblack.show()
	animasifade.play("fade")
	
func next_stage():
	stage = true
	colorreactblack.show()
	animasifade.play("fade")
	
func animasi_finish(anim_name):
	if stage == true:
		get_tree().change_scene(next_stage)
		get_tree().paused = false
	elif menu == true:
		get_tree().change_scene(main_menu)
		get_tree().paused = false
	elif dead == true :
		get_tree().reload_current_scene()
		get_tree().paused = false

func retry():
	dead = true 
	colorreactblack.show()
	animasifade.play("fade")

func dead():
	popup_dead.show()
	animasi_popop_dead.play("slidepopup")
	get_tree().paused = true
