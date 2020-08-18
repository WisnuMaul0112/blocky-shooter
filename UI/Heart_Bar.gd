extends Control

var current_heart = 3 setget update_bars
signal kurang
var mati = false

func _ready():
	self.current_heart = 3
	pass 

func update_bars(value):
	current_heart = value
	for bar in $Bar.get_children():
		bar.update_health(current_heart)

func heart_tambah():
	self.current_heart += 1

func  heart_kurang():
	self.current_heart -= 1
	emit_signal("kurang")
	
func _on_player_mati():
	heart_kurang()
	if current_heart == 0:
		get_tree().reload_current_scene()

		
