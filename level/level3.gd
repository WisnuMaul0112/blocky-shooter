extends Node2D

export var jumlah_spawn = 1
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet
var main_menu = "res://menu/HomeScreen.tscn"
var next_stage = "res://level/level4.tscn"
var stage = false
var menu = false
onready var player = $player
onready var animasifade = $CanvasLayer/AnimationPlayer
onready var colorreactblack = $CanvasLayer/ColorRect
onready var popup = $CanvasLayer/popup_win
onready var Bullet = $CanvasLayer/Label

func _ready():
	b = 3
	colorreactblack.hide()
	$CanvasLayer/bullet.text = "Bullet: " + str(b)
	popup.hide()

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
	var menang = $CanvasLayer/popup_win/AnimationPlayer
	menang.play("slidepopup")
	get_tree().paused = true
	
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
