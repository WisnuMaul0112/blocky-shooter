extends TextureRect

signal Continue
signal exit
onready var animasi = $AnimationPlayer

func _ready():
	animasi.play("slidepopup")

func _on_Button2_pressed():
	Music.click.play()
	emit_signal("exit")

func next_stage():
	Music.click.play()
	emit_signal("Continue")
