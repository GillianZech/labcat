extends Area2D
@onready var ldoors = get_parent().get_node("DoorsMap")

func _on_body_entered(_body):
	#ldoors.set_layer_name(0, "unlocked") #the value I was checking for when deciding if cat can walk through
	ldoors.set_layer_enabled(0, false) #make locked door sprites invisible (unlocked door sprites are revealed)
