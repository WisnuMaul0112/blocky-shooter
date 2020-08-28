extends CanvasLayer

func _ready():
	level2Button()

func level2Button():
	var buttonlevel2 = $levelButton2
	var texture = $levelButton2/TextureButton
	buttonlevel2.enable = true
	if buttonlevel2.enable:
		texture.texture_normal = buttonlevel2.open_texture
