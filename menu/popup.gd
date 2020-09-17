extends TextureRect

signal next_stage
signal main_menu
onready var animasi = $AnimationPlayer

func _ready():
	animasi.play("slidepopup")

func _on_Button2_pressed():
	Music.click.play()
	emit_signal("main_menu")

func next_stage():
	Music.click.play()
	emit_signal("next_stage")
