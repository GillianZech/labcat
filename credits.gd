extends Control

func _on_return_pressed():
	get_parent()._update_scene("menu")
