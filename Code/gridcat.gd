extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var walls = get_parent().get_node("Walls")
@onready var ldoors = get_parent().get_node("DoorsMap")
@onready var udoors = get_parent().get_node("UDoorsMap")
const gridsquare = 32
var currPos = Vector2(0,0)
var newPos: Vector2 = currPos
var ground_tile_id: int = 3
var ldoors_tile_id: int = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	newPos = currPos
	if Input.is_action_just_pressed("move_right"):
		newPos.x += 1
		sprite.play("right")
		update_position()
	elif Input.is_action_pressed("move_right"):
		if $MoveTimer.is_stopped():
			$MoveTimer.start() # slows down the movement
		newPos.x += 1
		sprite.play("right")
	
	if Input.is_action_just_pressed("move_left"):
		newPos.x -= 1
		sprite.play("left")
		update_position()
	elif Input.is_action_pressed("move_left"):
		if $MoveTimer.is_stopped():
			$MoveTimer.start()
		newPos.x -= 1
		sprite.play("left")
		
	if Input.is_action_just_pressed("move_up"):
		newPos.y -= 1
		sprite.play("up")
		update_position()
	elif Input.is_action_pressed("move_up"):
		if $MoveTimer.is_stopped():
			$MoveTimer.start()
		newPos.y -= 1
		sprite.play("up")
	
	if Input.is_action_just_pressed("move_down"):
		newPos.y += 1
		sprite.play("down")
		update_position()
	elif Input.is_action_pressed("move_down"):
		if $MoveTimer.is_stopped():
			$MoveTimer.start()
		newPos.y += 1
		sprite.play("down")
	
	if Input.is_action_just_pressed("lock"): # Enter key, for dev purposes
		ldoors.set_layer_enabled(0, true) #lock the doors
	if Input.is_action_just_pressed("unlock"): # Control key, for dev purposes
		ldoors.set_layer_enabled(0, false) #unlock the doors

func update_position():
	if walls.get_cell_source_id(0, newPos) != ground_tile_id: #it's not a wall
		if ldoors.get_cell_source_id(0, newPos) == ldoors_tile_id: # it's a door
			if not ldoors.is_layer_enabled(0): # can walk through
				currPos = newPos
			else: # cannot walk through
				pass
		else: # it's not a door, can walk through
			currPos = newPos
	else: # it's a wall, cannot walk through
		pass
	position = gridsquare * currPos # update cat's position, finally

func _on_move_timer_timeout():
	update_position()


# just snippets of code I tried that may be helpful in the future:
	#await get_tree().create_timer(0.2).timeout
	#$MoveTimer.timeout.disconnect(_on_move_timer_timeout)


