extends Label

func _process(dalta):
	var gestor = get_node_or_null("GestorJuego")  
	if gestor: text="Monedas:" +str(gestor.monedas_totales) 
