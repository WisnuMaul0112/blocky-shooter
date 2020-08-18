extends KinematicBody2D

export (int) var jumlah_peluru
export (PackedScene) var peluru 
export (int ) var speed 

var bullet_speed = 800
var bullet = preload("res://bullet/bullet.tscn")
var tembak = true
signal mati
signal nembak

func _ready():
	jumlah_peluru
	pass

func _process(delta):
	Global.bullet = jumlah_peluru
	
func _physics_process(delta):
	var gerak = Vector2()
	
	if Input.is_action_pressed("atas"):
		gerak.y -= 1
	if Input.is_action_pressed("bawah"):
		gerak.y += 1
	if Input.is_action_pressed("kiri"):
		gerak.x -= 1
	if Input.is_action_pressed("kanan"):
		gerak.x += 1
		
	gerak = gerak.normalized()
	gerak = move_and_slide(gerak*speed)
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("tembak") and tembak and jumlah_peluru != 0:
		Global.bullet = jumlah_peluru - 1
		emit_signal("nembak")
		shoot()
		jumlah_peluru -= 1

func shoot():
	var b = peluru.instance()
	b.transform = $muzzle.global_transform
	owner.add_child(b)

#func tembak():
#	jumlah_peluru= bullet.instance()
#	jumlah_peluru.position = get_global_position()
#	jumlah_peluru.rotation_degrees = rotation_degrees
#	jumlah_peluru.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
#	get_tree().get_root().call_deferred("add_child", jumlah_peluru)

func kill():
	emit_signal("mati")

func _on_Area2D_body_entered(body):
	if "enemy" in body.name:
		kill()

func _on_TambahPeluru_isi_peluru():
	jumlah_peluru += 2
