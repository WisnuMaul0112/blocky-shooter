extends TextureRect

signal next_stage
signal main_menu

func _ready():
	pass # Replace with function body.

func _on_Button2_pressed():
	emit_signal("main_menu")

func next_stage():
	emit_signal("next_stage")
