extends Area2D
@onready var ldoors = get_parent().get_node("DoorsMap")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(_body):
	ldoors.set_layer_name(0, "unlocked")
	ldoors.set_layer_enabled(0, false)
	pass # Replace with function body.
