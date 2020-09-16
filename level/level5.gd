extends Node2D

export var jumlah_spawn = 1
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet
var main_menu = "res://menu/HomeScreen.tscn"
var next_stage = "res://player/world.tscn"
var next_level = false
var exit = false
var dead = false
onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_popup_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var black = $CanvasLayer/ColorRect
onready var animasi = $CanvasLayer/AnimationPlayer
onready var popup = $CanvasLayer/popup_win
onready var animasi_popup = $CanvasLayer/popup_win/AnimationPlayer

func _ready():
	black.hide()
	popup.hide()
	b = 3
	$CanvasLayer/bullet.text = "Bullet: " + str(b)
	musuh
	randomize()
	$"way out"

func spawn():
	for i in range(jumlah_spawn):
		var musuh_muncul = musuh.instance()
		musuh_muncul.position.x = rand_range(-642.922, 2196.353)
		musuh_muncul.position.y = rand_range(648.13, 8.003)
		add_child(musuh_muncul)

func _on_spawn_musuh_timeout():
	spawn()
	pass

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)
	
func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func _on_portal_world():
	pass 

func menang():
	get_tree().paused = true
	Global.level["level 6"] = true
	popup.show()
	animasi_popup.play("slidepopup")

func main_menu():
	exit = true
	black.show()
	animasi.play("fade")

func next_stage():
	next_level = true
	black.show()
	animasi.play("fade")

func animation_finished(anim_name):
	if exit == true :
		get_tree().change_scene(main_menu)
		get_tree().paused = false
	elif next_level == true :
		get_tree().change_scene(next_stage)
		get_tree().paused = false
	elif dead == true:
		get_tree().reload_current_scene()
		get_tree().paused = false

func dead():
	popup_dead.show()
	animasi_popup_dead.play("slidepopup")
	get_tree().paused = true

func retry():
	dead = true
	animasi.play("fade")
	black.show()
