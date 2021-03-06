extends Node2D

onready var AnimationFade = $AnimationPlayer
onready var Fade = $CanvasLayer/Fade

# contoh
var level = "res://menu/level.tscn"
var tutorial_scene = "res://UI/tutorial.tscn"
var play = false
var tutorial = false

func _ready():
	Fade.hide()
	pass 

func play():
	Music.click.play()
	AnimationFade.play("Fade")
	Fade.show()
	play = true

func play_transision(anim_name):
	if play:
		get_tree().change_scene(level)
	elif tutorial:
		get_tree().change_scene(tutorial_scene)

func exit_pressed():
	Music.click.play()
	get_tree().quit()

func tutorial_pressed():
	Music.click.play()
	AnimationFade.play("Fade")
	Fade.show()
	tutorial = true
