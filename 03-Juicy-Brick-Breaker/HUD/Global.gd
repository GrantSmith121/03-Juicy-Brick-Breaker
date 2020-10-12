extends Node

var lives = 5
var score = 0
var level = 0

signal changed

func _ready():
	emit_signal("changed")

func update_score(s):
	score += s
	emit_signal("changed")

func update_lives(l):
	lives += l
	emit_signal("changed")
	if lives <= 0:
		get_tree().change_scene("res://GameOver.tscn")

func update_level(l):
	level += l
	emit_signal("changed")
