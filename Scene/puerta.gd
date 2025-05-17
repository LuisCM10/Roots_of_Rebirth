extends Area2D

class_name Door
@export var Nombre_Nivel_destino : String
@export var Nombre_Door_destino : String
@export var spawn_direction = "up"

@onready var spawn = $Spawn


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		pass
