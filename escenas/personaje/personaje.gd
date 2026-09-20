extends CharacterBody2D

@export var animacion: AnimatedSprite2D

var _vel_mov: float = 100.0
var _vel_jump: float = -300.0
func _physics_process(delta: float) -> void:
	
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
	
"""
var manzanas: int = 3
var costoManzanas: float = 10.6
var nombreTienda: String = "Soriana"
var estaAbierto: bool = false

func _ready() -> void:
	metodoPrueba()
	
func metodoPrueba() -> void: 
	print(manzanas)
	print(costoManzanas)
	print(nombreTienda)
	print(estaAbierto)
"""
