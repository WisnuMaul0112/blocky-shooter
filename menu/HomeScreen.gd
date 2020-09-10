extends CanvasLayer

onready var AnimationFade = $AnimationPlayer
onready var Fade = $Fade

# contoh
var level = "res://menu/level.tscn"
var tutorial_scene = "res://UI/tutorial.tscn"
var play = false
var tutorial = false

#
# Called when the node enters the scene tree for the first time.
func _ready():
	Fade.hide()
	pass 

func play():
	AnimationFade.play("Fade")
	Fade.show()
	play = true

func play_transision(anim_name):
	if play:
		get_tree().change_scene(level)
	elif tutorial:
		get_tree().change_scene(tutorial_scene)

func exit_pressed():
	get_tree().quit()

func tutorial_pressed():
	AnimationFade.play("Fade")
	Fade.show()
	tutorial = true
