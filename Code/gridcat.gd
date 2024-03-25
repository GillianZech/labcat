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
	#sprite.play("idle")
	var newPos: Vector2 = currPos
	if Input.is_action_just_pressed("move_right"):
		newPos.x += 1
		#sprite.look_at(self.position+Vector2(1,0))
		sprite.play("right")
	if Input.is_action_just_pressed("move_left"):
		newPos.x -= 1
		#sprite.look_at(self.position+Vector2(-1,0))
		sprite.play("left")
	if Input.is_action_just_pressed("move_up"):
		newPos.y -= 1
		#sprite.look_at(self.position+Vector2(0,-1))
		sprite.play("up")
	if Input.is_action_just_pressed("move_down"):
		newPos.y += 1
		#sprite.look_at(self.position+Vector2(0,1))
		sprite.play("down")
	
	# check what's in the grid at this coming spot
	if get_parent().get_node("TileMap").get_cell_source_id(0, newPos) != groundTileID:
		# I'm not sure why the layer is 0 or why the cell source ID for
		# tilemap cells is 3, but this is what works :)
		currPos = newPos
	else:
		print(get_parent().get_node("TileMap").get_cell_source_id(0, newPos))
	position = GRIDSQUARE * currPos
	
	
	
	
	#if Input.is_action_just_pressed("move_right"):
		#if _checkgrid([currPos[0]+GRIDSQUARE, currPos[1]]):
			#currPos[0] += GRIDSQUARE
		#sprite.look_at(self.position+Vector2(1,0))
	#if Input.is_action_just_pressed("move_left"):
		#if _checkgrid([currPos[0]-GRIDSQUARE, currPos[1]]):
			#currPos[0] -= GRIDSQUARE
		#sprite.look_at(self.position+Vector2(-1,0))
	#if Input.is_action_just_pressed("move_up"):
		#if _checkgrid([currPos[0], currPos[1]-GRIDSQUARE]):
			#currPos[1] -= GRIDSQUARE
		#sprite.look_at(self.position+Vector2(0,-1))
	#if Input.is_action_just_pressed("move_down"):
		#if _checkgrid([currPos[0], currPos[1]+GRIDSQUARE]):
			#currPos[1] += GRIDSQUARE
		#sprite.look_at(self.position+Vector2(0,1))
#
	#position = Vector2(currPos[0], currPos[1])

#func _checkgrid(position):
	#
	#var groundTileID: int = 0
	#if get_parent().get_node("TileMap").get_cell_source_id(0, Vector2(currPos[0], currPos[1])) == groundTileID:
		#return true
	#return false
	
	
	#get_parent().get_node("TileMap").get_cell_source_id()
	#
	#return true
