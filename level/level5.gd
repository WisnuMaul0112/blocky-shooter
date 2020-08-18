extends Node2D

export var jumlah_spawn = 1
var musuh = preload("res://enemy/enemy.tscn")
var b = Global.bullet

func _ready():
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