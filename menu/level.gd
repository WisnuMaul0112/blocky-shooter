extends Node2D

onready var level1_enable = $levelButton1
onready var level1_texture = $levelButton1/TextureButton

onready var level2_enable = $levelButton2
onready var level2_texture = $levelButton2/TextureButton

onready var level3_enable = $levelButton3
onready var level3_texture = $levelButton3/TextureButton

onready var level4_enable = $levelButton4
onready var level4_texture = $levelButton4/TextureButton

onready var level5_enable = $levelButton5
onready var level5_texture = $levelButton5/TextureButton

onready var level6_enable = $levelButton6
onready var level6_texture = $levelButton6/TextureButton
onready var StageTitle = $CanvasLayer/label
var exit = "res://menu/HomeScreen.tscn"
func _ready():
	pass

func _process(delta):
	if Global.level["level 1"] == true and level1_enable.touch == true:
		level1_enable.enable = true
		level1_texture.normal = level1_enable.open_texture
		
	if Global.level["level 2"] == true :
		level2_enable.enable = true
		level2_texture.normal = level2_enable.open_texture
		
	if Global.level["level 3"]== true :
		level3_enable.enable = true
		level3_texture.normal = level3_enable.open_texture
		
	if Global.level["level 4"]== true :
		level4_enable.enable = true
		level4_texture.normal = level4_enable.open_texture
		
	if Global.level["level 5"]== true :
		level5_enable.enable = true
		level5_texture.normal = level5_enable.open_texture
	
	if Global.level["level 6"] == true :
		level6_enable.enable = true
		level6_texture.normal = level6_enable.open_texture
	
	if Global.level["game finished"] == true:
		StageTitle.text = "Stage Complete"
		
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().change_scene(exit)
		
func _on_backButton_pressed():
	get_tree().change_scene(exit)
