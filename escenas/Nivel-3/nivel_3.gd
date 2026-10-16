extends Node2D

@onready var etiqueta_monedas = $EtiquetaMonedas
var monedas_contadas = 0 

func sumar_una_moneda():
	monedas_contadas += 1
	etiqueta_monedas.text = "Monedas:0"+str(monedas_contadas)
	
