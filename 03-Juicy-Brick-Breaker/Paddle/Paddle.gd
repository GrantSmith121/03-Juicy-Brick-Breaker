extends KinematicBody2D

onready var collision_transform = $CollisionShape2D.get_transform().get_scale()	


onready var target_y = position.y

onready var VP = get_viewport()
onready var VP_size = get_viewport_rect().size
export var paddle_speed = 20

export var speed = 30
export var distort = Vector2(1.5,1.1)
export var fall_duration = 3

func _ready():
	position.y = get_viewport_rect().size.y - 50
	$AnimatedSprite.play("default")

func _physics_process(_delta):
	var target = VP.get_mouse_position().x
	target = clamp(target, 0, VP_size.x)
	var d = (target - position.x)
	var s = sign(d)
	if abs(d) > paddle_speed:
		position.x += s*paddle_speed
	else:
		position.x += d
	var mouse = get_local_mouse_position()
	rotation += mouse.angle()
	rotation_degrees += 90


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("default")
