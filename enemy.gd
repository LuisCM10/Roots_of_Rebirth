extends CharacterBody2D
@onready var player = $"../player"
@onready var anim = $AnimatedSprite2D
@export var speed = 75
var player_pos
@export var attack = 7.5
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
	if position.distance_to(player_pos) <= 20:
		if direction.x < 0:
			anim.play("attack_left")			
		else:
			anim.play("attack_right")
		player.life -= attack
		return
	if velocity.x:
		anim.play("walk")
	else:
		anim.play("back_idle")
	
		
