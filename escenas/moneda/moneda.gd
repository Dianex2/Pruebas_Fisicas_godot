extends Node2D
@export var area_2d: Area2D

var contenedor_monedas: ContenedorMonedas
@onready var sonido = $AudioStreamPlayer2D

func _ready() -> void:
	area_2d.body_entered.connect(_recogida)
	_iniciar_animacion()
	
func _recogida(_body) -> void:
	if _body.name == "Personaje":
			var nivel = get_parent().get_parent()
			nivel.sumar_una_moneda() 
			
			if sonido and sonido.stream !=null:
				sonido.play()
				
				var tween = create_tween()
				tween.set_ease(Tween.EASE_IN_OUT)
				tween.tween_property(self,"rotation",rotation + TAU,0.4)
				tween.parallel().tween_property(self, "scale",Vector2.ZERO,0.4)
				await  tween.finished
				queue_free()
			
func _iniciar_animacion():
	var tween: Tween =create_tween()
	tween.set_loops(0)
	tween.tween_property(self, "position:y", position.y - 5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "position:y", position.y + 5, 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

func _on_area_2d_body_entered(body: Node2D) -> void:
	pass 


func play(body: Node2D) -> void:
	pass # Replace with function body.
