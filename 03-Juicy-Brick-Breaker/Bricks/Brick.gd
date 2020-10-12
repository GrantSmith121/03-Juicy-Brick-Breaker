extends RigidBody2D

onready var Ball = load("res://Bricks/Brick.tscn")

onready var target_y = position.y
onready var VP = get_viewport_rect().size

export var fall_speed = 1.0


var row = 0
var col = 0

var fall_duration = 10

var dying = false

func _ready():
	update_color()

func _physics_process(_delta):
	if dying:
		collision_layer = 10
		collision_mask = 10
		gravity_scale = 9
		angular_velocity = 5
	if position.y > VP.y + 30:
			queue_free()

func update_color():
	if row == 0:
		$AnimatedSprite.play("red")
	if row == 1:
		$AnimatedSprite.play("orange")
	if row == 2:
		$AnimatedSprite.play("yellow")
	if row == 3:
		$AnimatedSprite.play("green")
	if row == 4:
		$AnimatedSprite.play("cyan")
	if row == 5:
		$AnimatedSprite.play("blue")
	if row == 6:
		$AnimatedSprite.play("purple")

func die():
	dying = true


func start_brick():
	position = Vector2(position.x,target_y)




func _on_Ball_body_entered():
	die()
	$AnimatedSprite.play("red")


func _on_Brick_body_shape_entered(body_id, body, body_shape, local_shape):
	queue_free()
