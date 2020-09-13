extends TextureRect

signal retry
signal main_menu

func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	Music.click.play()
	emit_signal("main_menu")

func retry():
	Music.click.play()
	emit_signal("retry")
