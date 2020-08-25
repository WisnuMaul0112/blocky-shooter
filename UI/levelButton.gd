extends Node2D

export (int) var level 
export (String) var level_load
export(bool) var enable

export(Texture) var blocked_texture
export (Texture) var open_texture

onready var level_label = $TextureButton/Label
onready var button = $TextureButton

func setup():
	level_label = String(level)
	if enable:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
	pass
	

# Called when the node enters the scene tree for the first time.
func _ready():
	setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_TextureButton_pressed():
	if enable:
		get_tree().change_scene(level_load)
