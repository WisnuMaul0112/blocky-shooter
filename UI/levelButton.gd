extends Node2D

export (int) var level 
export (String) var level_load
export(bool) var enable

export(Texture) var blocked_texture
export (Texture) var open_texture

onready var level_label = $TextureButton/Label
onready var button = $TextureButton

func setup():
	level_label.text = str(level)
	if enable:
		button.texture_normal = open_texture
	else:
		button.texture_normal = blocked_texture
	pass

func _ready():
	setup()

func _on_TextureButton_pressed():
	if enable:
		change_scene()

func change_scene():
	get_tree().change_scene(level_load)
