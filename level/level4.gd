extends Node2D

export var jumlah_spawn = 1
var exit = false
var next_level = false
var dead = false
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet
var next_stage = "res://menu/level.tscn"
var home_screen = "res://menu/HomeScreen.tscn"
onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_popup_dead = $CanvasLayer/popup_dead/AnimationPlayer
onready var animasi = $CanvasLayer/AnimationPlayer
onready var black = $CanvasLayer/ColorRect
onready var popup = $CanvasLayer/popup_win
onready var animasi_popup_win = $CanvasLayer/popup_win/AnimationPlayer

func _ready():
	b = 3
	black.hide()
	popup.hide()
	popup_dead.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)
	musuh

func spawn():
	for i in range(jumlah_spawn):
		var musuh_muncul = musuh.instance()
		musuh_muncul.position.x = rand_range(1638.913, -13.829)
		musuh_muncul.position.y = rand_range(109.272, 616.31)
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
	popup.show()
	animasi_popup_win.play("slidepopup")
	get_tree().paused = true
	
func main_menu():
	exit = true
	animasi.play("fade")
	black.show()


func next_stage():
	next_level = true
	LevelUnlock.level5 = true
	animasi.play("fade")
	black.show()

func animation_finished(anim_name):
	if exit == true :
		get_tree().change_scene(home_screen)
		get_tree().paused = false
	elif next_level == true:
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
	animasi.play("fade")
	black.show()
