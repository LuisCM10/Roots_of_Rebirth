extends Node

const scene_level = preload("res://level.tscn")

var spawn_door_tag

func go_to_level (level_tag, destination_door):
	var scene_to_load
	
	match level_tag:
		"level":
			scene_to_load = scene_level
			
		if scene_to_load != null:
				spawn_door_tag = destination_door
				get_tree().change_scene_to_packed(scene_to_load)
