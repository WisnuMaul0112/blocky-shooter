extends Node2D

export var jumlah_spawn = 1
var b = Global.bullet
var next_stage = "res://menu/level.tscn"
var main_menu = "res://menu/HomeScreen.tscn"
var musuh = preload("res://enemy/enemy.tscn")
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
onready var paused = $CanvasLayer/paused

func _ready():
	b = 10
	popup.hide()
	popup_dead.hide()
	colorreactblack.hide()
	paused.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)
	
func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func menang():
	popup.show()
	animasi_popup_win.play("slidepopup")
	get_tree().paused = true
	Global.level["level 3"] = true
	Global.save_file()

func main_menu():
	menu = true
	colorreactblack.show()
	paused.hide()
	animasifade.play("fade")

func next_stage():
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

func spawn():
	for i in range(jumlah_spawn):
		var musuh_muncul = musuh.instance()
		musuh_muncul.position.x = rand_range(1270.141, -198.435)
		musuh_muncul.position.y = rand_range(120.511, 632.805)
		add_child(musuh_muncul)
		
func SpawnMusuh_timeout():
	spawn()

func Continue():
	get_tree().paused = false
	paused.hide()
	
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().paused = true
		paused.show()
