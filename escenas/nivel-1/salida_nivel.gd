extends Area2D

func _ready():
	body_entered.connect(cuando_llega)
	
func cuando_llega(body):
	if body.name == "Personaje":
		get_tree().change_scene_to_file("res://escenas/Nivel-2/nivel_2.tscn")
