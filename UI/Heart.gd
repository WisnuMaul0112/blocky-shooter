extends HBoxContainer

enum MODES {simple}
var heart_full = preload("res://assets/hud_heartFull.png")
export (MODES) var mode = 	MODES.simple

func _ready():
	pass 

func update_health(value):
	match mode:
		MODES.simple:
			update_simple(value)

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
