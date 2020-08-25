extends CanvasLayer
var level 
var tutorial

# contoh
var play = "res://menu/level.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func play():
	get_tree().change_scene(play)
