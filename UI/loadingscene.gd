extends VBoxContainer

onready var loading = $CanvasLayer/TextureProgress

func _ready():
	loading.value = 0
	get_tree().paused = true
	
func _process(delta):
	loading.value += 0.5
	if loading.value == loading.max_value:
		get_tree().paused = false
		queue_free()
