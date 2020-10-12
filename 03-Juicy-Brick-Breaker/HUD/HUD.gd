extends Node2D

func _ready():
	Global.connect("changed",self, "_on_Global_changed")

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_lives():
	$Health.text = "Health: " + str(Global.lives)

func _on_Global_changed():
	update_score()
	update_lives()
