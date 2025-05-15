extends Node2D

@export var enemy_scene: PackedScene
@export var player_scene: PackedScene
func _ready() -> void:
	var player_instance = player_scene.instantiate()
	add_child(player_instance)
	for x in range(10):
		var enemy_instance = enemy_scene.instantiate()
		add_child(enemy_instance)
		enemy_instance.global_position = Vector2(randf_range(10,get_viewport_rect().size.x), randf_range(10,get_viewport_rect().size.y))
		
