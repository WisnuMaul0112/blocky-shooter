extends CanvasLayer

onready var AnimationFade = $AnimationPlayer
onready var Fade = $Fade

# contoh
var play = "res://menu/level.tscn"
var level 
var tutorial

#
# Called when the node enters the scene tree for the first time.
func _ready():
	Fade.hide()
	pass 

func play():
	AnimationFade.play("Fade")
	Fade.show()


func play_transision(anim_name):
	get_tree().change_scene(play)
