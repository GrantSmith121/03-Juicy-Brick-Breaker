extends Control

func _ready():
	pass



func _on_Play_pressed():
	Global.update_lives(5)
	Global.update_score(-Global.score)
	get_tree().change_scene("res://Game.tscn")
