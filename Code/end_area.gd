extends Area2D
@export var NEXT_LEVEL: String = "level_2"

func _physics_process(_delta):
	if Input.is_action_just_pressed("dev"): # Alt
		get_parent().get_parent()._update_scene(NEXT_LEVEL)

func _on_body_entered(_body):
	get_parent().get_parent()._update_scene(NEXT_LEVEL)
