extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var walls = get_parent().get_node("Walls")
@onready var ldoors = get_parent().get_node("DoorsMap")
@onready var udoors = get_parent().get_node("UDoorsMap")
const GRIDSQUARE = 32
var currPos = Vector2(0,0)
var groundTileID: int = 3
var x = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	var newPos: Vector2 = currPos
	if Input.is_action_just_pressed("move_right"):
		newPos.x += 1
		sprite.play("right")
	if Input.is_action_just_pressed("move_left"):
		newPos.x -= 1
		sprite.play("left")
	if Input.is_action_just_pressed("move_up"):
		newPos.y -= 1
		sprite.play("up")
	if Input.is_action_just_pressed("move_down"):
		newPos.y += 1
		sprite.play("down")
	if Input.is_action_just_pressed("lock"): # Enter key
		#lock the doors
		ldoors.set_layer_name(0, "locked")
		ldoors.set_layer_enabled(0, true)
	if Input.is_action_just_pressed("unlock"): # Control key
		#unlock the doors
		ldoors.set_layer_name(0, "unlocked")
		ldoors.set_layer_enabled(0, false)

	if walls.get_cell_source_id(0, newPos) != 3: #it's not a wall
		if ldoors.get_cell_source_id(0, newPos) == 4: # it's a door
			if ldoors.get_layer_name(0) == "unlocked": # can walk through
				currPos = newPos
			else: # cannot walk through
				pass
		else: # it's not a door, can walk through
			currPos = newPos
	else: # it's a wall, cannot walk through
		#if walls.get_cell_source_id(0, newPos) == 3: #if I walk into a wall, unlock the doors
			#ldoors.set_layer_enabled(0, false) #makes it invisible
			#ldoors.set_layer_name(0, "unlocked") 
		pass

	position = GRIDSQUARE * currPos
	
