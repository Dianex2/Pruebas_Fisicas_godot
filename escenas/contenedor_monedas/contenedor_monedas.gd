class_name ContenedorMonedas
extends Node

var _total_monedas: int 
var _monedas_recolectadas: int 
var contador_visible:Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var monedas := get_children()
	_total_monedas = monedas.size()
	
#Busca la etiqueta que dice "ContadorMonedas"
	for moneda in monedas:
		moneda.contenedor_monedas=self
		
func moneda_recojida():
	_monedas_recolectadas += 1
	
	if _monedas_recolectadas == _total_monedas:
		get_parent().get_parent().siguiente_nivel()
