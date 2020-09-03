extends TextureRect

signal retry
signal main_menu

func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	emit_signal("main_menu")

func retry():
	emit_signal("retry")
