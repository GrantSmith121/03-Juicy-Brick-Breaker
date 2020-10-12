extends Node2D

onready var VP = get_viewport_rect().size
onready var Brick = load("res://Bricks/Brick.tscn")

export var W = 8
export var H = 7
export var top_margin = 100
export var margin = 3

var B = Vector2(90, 30)

func _ready():
	start_bricks()

func _physics_process(_delta):
	if Global.score == 560:
		Global.update_level(1)
		start_bricks()

func start_bricks():
	for c in get_children():
		c.queue_free()
	var startx = (VP.x / 2) - (B.x ) * (W/2)
	var starty = top_margin
	if Global.level <= 0:
		for w in range(W):
			for h in range(H):
				var brick = Brick.instance()
				brick.position = Vector2(startx + w*(B.x+margin), starty + h*(B.y+margin))
				brick.row = h
				brick.col = w
				add_child(brick)
				brick.start_brick()
	else:
		var brick = Brick.instance()
		brick.position = Vector2(startx + 3*(B.x+margin), starty + 4*(B.y+margin))
		brick.row = 3
		brick.col = 3
		add_child(brick)
		brick.start_brick()
