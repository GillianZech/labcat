extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
const GRIDSQUARE = 32
var currPos = Vector2(0,0)
var groundTileID: int = 3

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
	
	# check what's in the grid at this coming spot
	if get_parent().get_node("TileMap").get_cell_source_id(0, newPos) != groundTileID:
		# I'm not sure why the layer is 0 or why the cell source ID for
		# tilemap cells is 3, but this is what works :)
		# may have to change this when I make doors
		# or maybe I can just make doors a tilemap with a different ID
		# and check for that ID too, but to get through the door I'd have
		# to delete the door in code?
		currPos = newPos
	else:
		print(get_parent().get_node("TileMap").get_cell_source_id(0, newPos))
	position = GRIDSQUARE * currPos
	
