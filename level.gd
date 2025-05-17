extends Node2D

@export var enemy_scene: PackedScene
@export var player_scene: PackedScene

var starting_nodes: int
var current_nodes: int

func _ready() -> void:
	var player_instance = player_scene.instantiate()
	add_child(player_instance)
	starting_nodes = get_child_count()
	current_nodes = get_child_count()
	for x in range(1,46):
		var enemy_instance = enemy_scene.instantiate()
		var spawn_name = "TilemapLayers/SpawnZones/MiniEnemySpawn"+str(x)
		if has_node(spawn_name):	
			var node = get_node(spawn_name)
			enemy_instance.global_position = node.global_position
			add_child(enemy_instance)	
			
