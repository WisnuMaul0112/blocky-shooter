extends Node2D

var bullet 
var level ={"level 1":true,
			"level 2":false,
			"level 3":false,
			"level 4":false,
			"level 5":false,
			}
var save_file = "user://savefile.data"

func _ready():
	load_file()

func load_file():
	var f = File.new()
	if not f.file_exists(save_file): return
	f.open(save_file, File.READ)
	level = f.get_var()
	f.close()
	pass

func save_file():
	var f = File.new()
	f.open(save_file, File.WRITE)
	f.store_var(level)
	f.close()
	pass

func set_file(new_value):
	level = new_value
	save_file()
	pass
