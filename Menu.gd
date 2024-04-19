extends Control 

func _on_play_pressed():
	get_parent()._update_scene("level_1")

func _on_credits_pressed():
	get_parent()._update_scene("credits")

func _on_quit_pressed():
	get_tree().quit()

@onready var catty = $AnimatedSprite2D
func _ready():
	catty.play("spin")
