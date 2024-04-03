extends Area2D
@export var NEXT_LEVEL: String = "level_2"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("dev"): # Alt
		get_parent().get_parent()._update_scene(NEXT_LEVEL)


func _on_body_entered(body):
	get_parent().get_parent()._update_scene(NEXT_LEVEL)
