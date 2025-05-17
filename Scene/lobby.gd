extends Node2D

@export var player_scene: PackedScene

func _ready() -> void:
	if NavigationManage.spawn_door_tag != null:
		_on_level_spawn(NavigationManage.spawn_door_tag)
	var player_instance = player_scene.instantiate() as Player
	add_child(player_instance)

func _on_level_spawn(spawn_door : String):
	var door_path = "$Doors/Door_"+spawn_door
	var door = get_node(door_path) as Door
	NavigationManage.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)
