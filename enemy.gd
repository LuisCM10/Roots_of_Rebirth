extends CharacterBody2D
@onready var player = $"../player"
@onready var anim = $AnimatedSprite2D
const scene_lobby = preload("res://Scene/lobby.tscn")
@export var speed = 75
var player_pos
@export var attack = 7.5
var countdown = 0
var direction
	
func _physics_process(delta):
	if player == null:
		return

	player_pos = player.position
	direction = (player_pos - position).normalized()
	
	if position.distance_to(player_pos) < 200:
		velocity = direction * speed			
	else:
		velocity = Vector2.ZERO
	update_anim()
	move_and_slide()

func update_anim ():
	if position.distance_to(player_pos) <= 30 and countdown == 0:		
		player.life -= attack
		print("Vida: "+ str(player.life))
		countdown = 100
		if direction.x < 0:
			anim.play("attack_left", 2.4)			
		else:
			anim.play("attack_right", 2.4)
		return
	elif position.distance_to(player_pos) <= 30 and countdown <= 100:
		if player.life <= 0:
			get_tree().change_scene_to_packed(scene_lobby)		
		countdown -= 1
		return
	if velocity.x:
		anim.play("walk")
		return
	else:
		anim.play("back_idle")
		return
		
	
		
