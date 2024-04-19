extends Node
@onready var CURRENT_LEVEL = $Menu
@onready var CURRENT_LEVEL_NAME: String = "menu"
@onready var NEXT_LEVEL
@onready var NEXT_LEVEL_NAME: String = "level_1"
@onready var RELOAD
@onready var ADVANCING: bool
#@onready var hud = get_node("HUD")
@export var ANIM: AnimationPlayer

func _ready():
	pass
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("restart"): # R key
		# Restart the current level
		_restart()
	

func _update_scene(NEXT_DESTINATION_NAME):
	NEXT_LEVEL_NAME = NEXT_DESTINATION_NAME
	#hud.visible = false
	ADVANCING = true
	ANIM.play("fade_in")

func _restart():
	#hud.visible = false
	ADVANCING = false
	ANIM.play("fade_in")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		if ADVANCING == true:
			NEXT_LEVEL = load("res://Scenes/" + NEXT_LEVEL_NAME + (".tscn")).instantiate()
			NEXT_LEVEL.visible = false
			add_child(NEXT_LEVEL)
			CURRENT_LEVEL.queue_free() #deletes current level
			CURRENT_LEVEL = NEXT_LEVEL
			CURRENT_LEVEL_NAME = NEXT_LEVEL_NAME
			CURRENT_LEVEL.visible = true
			ANIM.play("fade_out")
		else:
			RELOAD = load("res://Scenes/" + CURRENT_LEVEL_NAME + (".tscn")).instantiate()
			RELOAD.visible = false
			add_child(RELOAD)
			CURRENT_LEVEL.queue_free()
			CURRENT_LEVEL = RELOAD
			CURRENT_LEVEL.visible = true
			ANIM.play("fade_out")
	if anim_name == "fade_out": #do these things once the level fully loads back in
		pass
