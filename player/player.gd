extends KinematicBody2D

export (int) var jumlah_peluru
export (PackedScene) var peluru 
export (int ) var speed 
export (float) var jeda_tembak = 1

onready var  cooldown = $cooldown 
onready var animasi = $AnimationPlayer 
onready var player = $karakter
onready var pistol = $pistol

#var flip = 824
onready var joystick = $CanvasLayer/joystick/joystick_button
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
	var Analog = $CanvasLayer/Analog
	var AnalogTembak = $CanvasLayer/AnalogTembak
	var muter = $CanvasLayer/joystick/joystick_button
	
	#on analog schene weare add formula 90-rad2deg(TouchPos.angle_to_point(position))
	# then if we are want to give them back to Radian just add this formual Radian = (Angle - 90)*-1
	
	#analog gerak
	#gerak = Vector2(cos(-deg2rad(Analog.Angle-90)),sin(-deg2rad(Analog.Angle-90)))*Analog.Strength*speed
	#rotation = deg2rad(-Analog.Angle)
	
	#analog tembak
	player_tembak = Vector2(cos(-deg2rad(AnalogTembak.Angle-90)),sin(-deg2rad(AnalogTembak.Angle-90)))*AnalogTembak.Strength*1
	rotation = deg2rad(90-AnalogTembak.Angle)
	
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
		animasi.play("tembak")
		animasi.play("camerashake")
		Global.bullet = jumlah_peluru - 1
		emit_signal("nembak")
		shoot()
		jumlah_peluru -= 1
		Music.shoot.play()
	
	#------------------------------gameplay mobile
	#gerak = move_and_slide(joystick.get_value() * speed)
	#if tembak && jumlah_peluru != 0 && cooldown.is_stopped() && AnalogTembak.Strength != 0.0:
	#	cooldown.start(jeda_tembak)
	#	animasi.play("tembak")
	#	animasi.play("camerashake")
	#	Global.bullet = jumlah_peluru - 1
	#	emit_signal("nembak")
	#	shoot()
	#	jumlah_peluru -= 1
	#	Music.shoot.play()

func _input(event):
	#input pressed
	if event.is_action_pressed("atas") or event.is_action_pressed("bawah") or event.is_action_pressed("kanan") or event.is_action_pressed("kiri") :
		#jalan = true
		#Music.walk.play()
		pass
	else:
		#jalan = false
		#Music.walk.stop()
		pass
		
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
