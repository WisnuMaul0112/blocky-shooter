extends Node2D

var b = Global.bullet

func _ready():
	b = 3
	$CanvasLayer/bullet.text = "Bullet: " + str(b)

func _on_player_nembak():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet)
	

func _on_TambahPeluru_isi_peluru():
	$CanvasLayer/bullet.text = "Bullet: " + str(Global.bullet + 2)

func _on_portal_world():
	pass 
