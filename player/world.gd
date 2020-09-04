extends Node2D

export var jumlah_spawn = 1
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet
var dead = false
var exit = false
onready var animasifade = $CanvasLayer/AnimationPlayer
onready var color_react = $CanvasLayer/ColorRect
onready var main_menu = "res://menu/HomeScreen.tscn"
onready var popup_dead = $CanvasLayer/popup_dead
onready var animasi_popup_dead = $CanvasLayer/popup_dead/AnimationPlayer

func _ready():
	b = 3
	$CanvasLayer/bullet.text = "Bullet: " + str(b)
	popup_dead.hide()
	color_react.hide()
	
func spawn():
	for i in range(jumlah_spawn):
		var musuh_muncul = musuh.instance()
		musuh_muncul.position.x = rand_range(2424.111, 2424.111)
		musuh_muncul.position.y = rand_range(2207.426, 1214.096)
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


func animation_finished(anim_name):
	if dead == true :
		get_tree().reload_current_scene()
		get_tree().paused = false
	elif exit == true :
		get_tree().change_scene(main_menu)
		get_tree().paused = false


func dead():
	popup_dead.show()
	animasi_popup_dead.play("slidepopup")
	get_tree().paused = true

func main_menu():
	exit = true 
	color_react.show()
	animasifade.play("fade")
	
func retry():
	dead = true 
	color_react.show()
	animasifade.play("fade")
	
