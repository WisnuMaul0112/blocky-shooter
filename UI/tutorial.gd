extends TextureRect
onready var animasi = $AnimationPlayer

func _ready():
	animasi.play("slide")
