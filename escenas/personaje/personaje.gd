extends CharacterBody2D
signal  personaje_muerto
@export var animacion: AnimatedSprite2D
@export  var area_2d: Area2D

var _vel_mov: float = 100.0
var _vel_jump: float = -300.0
var _muerto: bool 


func _ready() -> void:
	add_to_group("personajes")
	area_2d.body_entered.connect(_tocar_pinchos)
	
func _physics_process(delta: float) -> void:
	if _muerto:
		return 
	
	#asignamos  gravedad al personaje 
	velocity += get_gravity() * delta
	
	#Funcion de saltar para el personaje 
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		velocity.y = _vel_jump
	
	
	#Movimiento lateral del personaje 
	if Input.is_action_pressed("ui_right"):
		velocity.x = _vel_mov
		animacion.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -_vel_mov
		animacion.flip_h= false
	else:
		velocity.x = 0
	move_and_slide()
	
	
	if  !is_on_floor():
		animacion.play("jump")
	elif velocity.x != 0:
		animacion.play("run")
	else:
		animacion.play("idle")
	
func _tocar_pinchos(_body: Node2D) -> void:
	if _muerto:
		return

	_muerto = true
	animacion.modulate = Color.RED
	animacion.stop()
	
	reproducir_sonido_muerte()
	
	await get_tree().create_timer(0.5).timeout
	get_tree().reload_current_scene()
	
func reproducir_sonido_muerte() -> void:
	var audio = get_node_or_null("Sonido muerte")  
	if audio and audio.stream !=null: audio.play()
