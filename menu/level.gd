extends CanvasLayer

onready var level2_enable = $levelButton2
onready var level2_texture = $levelButton2/TextureButton

onready var level3_enable = $levelButton3
onready var level3_texture = $levelButton3/TextureButton

onready var level4_enable = $levelButton4
onready var level4_texture = $levelButton4/TextureButton

onready var level5_enable = $levelButton5
onready var level5_texture = $levelButton5/TextureButton
func _ready():
	pass

func _process(delta):
	if Global.level["level 2"] == true :
		level2_enable.enable = true
		level2_texture.texture_normal = level2_enable.open_texture
	if Global.level["level 3"]== true :
		level3_enable.enable = true
		level3_texture.texture_normal = level3_enable.open_texture
	if Global.level["level 4"]== true :
		level4_enable.enable = true
		level4_texture.texture_normal = level4_enable.open_texture
	if Global.level["level 5"]== true :
		level5_enable.enable = true
		level5_texture.texture_normal = level5_enable.open_texture

func level3Button():
	var buttonlevel3 = $levelButton3
	var texture = $levelButton3/TextureButton
	buttonlevel3.enable = true
	if buttonlevel3.enable:
		texture.texture_normal = buttonlevel3.open_texture

func level4Button():
	var buttonlevel4 = $levelButton4
	var texture = $levelButton4/TextureButton
	buttonlevel4.enable = true
	if buttonlevel4.enable:
		texture.texture_normal = buttonlevel4.open_texture

func level5Button():
	var buttonlevel5 = $levelButton5
	var texture = $levelButton5/TextureButton
	buttonlevel5.enable = true
	if buttonlevel5.enable:
		texture.texture_normal = buttonlevel5.open_texture
