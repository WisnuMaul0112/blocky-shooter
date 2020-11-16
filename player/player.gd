extends KinematicBody2D

export (int) var jumlah_peluru
export (PackedScene) var peluru 
export (int ) var speed 
export (float) var jeda_tembak = 1

onready var  cooldown = $cooldown 
onready var animasi = $AnimationPlayer 
onready var player = $karakter
onready var pistol = $pistol

var bullet_speed = 800
var bullet = preload("res://bullet/bullet.tscn")
var tembak = true
var jalan = false

signal mati
signal nembak

func _ready():
	jumlah_peluru
	jalan = false
	pass

func _process(delta):
	Global.bullet = jumlah_peluru
	flip()

func _physics_process(delta):
	var gerak = Vector2()
	var player_tembak = Vector2()

	#input pressed
	if Input.is_action_pressed("atas"):
		gerak.y -= 1
	if Input.is_action_pressed("bawah"):
		gerak.y += 1
	if Input.is_action_pressed("kiri"):
		gerak.x -= 1
	if Input.is_action_pressed("kanan"):
		gerak.x += 1
	

	#-----------------------------gameplay desktop
	gerak = gerak.normalized()
	gerak = move_and_slide(gerak*speed)
	look_at(get_global_mouse_position())
	
	if tembak && jumlah_peluru != 0 && cooldown.is_stopped() && Input.is_action_pressed("tembak"):
		cooldown.start(jeda_tembak)
		animasi.play("camerashake")
		Global.bullet = jumlah_peluru - 1
		emit_signal("nembak")
		shoot()
		jumlah_peluru -= 1
		Music.shoot.play()

func shoot():
	var b = peluru.instance()
	b.transform = $muzzle.global_transform
	get_tree().get_root().call_deferred("add_child", b)
	cooldown.start()
	#owner.add_child(b)

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

func flip():
	var direction = sign(get_global_mouse_position().x - player.global_position.x)
	if direction < 0 :
		player.flip_h = true
		pistol.flip_v = true
	else:
		player.flip_h = false
		pistol.flip_v = false

func _on_kedip_timeout():
	animasi.play("kedip")
