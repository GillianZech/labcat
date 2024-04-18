extends Control 


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")




func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")




func _on_quit_pressed():
	get_tree().quit()

@onready var catty = $AnimatedSprite2D
func _ready():
	catty.play("spin")
	
	
