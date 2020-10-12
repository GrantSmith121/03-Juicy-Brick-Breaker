extends Node2D

onready var Ball = load("res://Ball/Ball.tscn")
var speed = 300

func _ready():
	load_ball()

func _physics_process(_delta):
	if get_child_count() == 0:
		load_ball()

func load_ball():
	var ball = Ball.instance()
	add_child(ball)
