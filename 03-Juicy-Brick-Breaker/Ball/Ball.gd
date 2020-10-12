extends RigidBody2D

onready var VP = get_viewport_rect().size
export var min_speed = 100.0
export var max_speed = 500.0

onready var effect_brick = get_node("/root/Game/BrickSmash")
onready var effect_paddle = get_node("/root/Game/PaddleTouch")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	position = Vector2(VP.x/2,VP.y - 200)
	$AnimatedSprite.play("default")

func _physics_process(_delta):
	if position.y > VP.y + 30:
		die()
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.get_parent().name == "PaddleContainer":
			$AnimatedSprite.play("hit")
			body.find_node("AnimatedSprite").play("Hit")
			effect_paddle.play()
		if body.is_in_group("brick"):
			body.die()
			effect_brick.play()
			Global.update_score(10)
		else:
			effect_paddle.play()
	if Input.is_action_just_pressed("resetball"):
		die()


func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sin(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.x) > max_speed:
		state.linear_velocity.x = sin(state.linear_velocity.x) * max_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sin(state.linear_velocity.y) * min_speed
	if abs(state.linear_velocity.y) > max_speed:
		state.linear_velocity.y = sin(state.linear_velocity.y) * max_speed


func die():
	Global.update_lives(-1)
	queue_free()

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("default")
