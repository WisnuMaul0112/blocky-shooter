extends TextureRect
onready var animasi = $AnimationPlayer
onready var colorreact = $CanvasLayer/ColorRect
var exit = "res://menu/HomeScreen.tscn"

func _ready():
	animasi.play("slide")
	colorreact.hide()
	
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().change_scene(exit)

func _on_backButtonn_pressed():
	get_tree().change_scene(exit)
