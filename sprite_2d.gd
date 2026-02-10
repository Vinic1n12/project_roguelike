extends Node2D
class_name Room


@export var spU: Texture2D
@export var spD: Texture2D
@export var spR: Texture2D
@export var spL: Texture2D
@export var spUD: Texture2D
@export var spRL: Texture2D
@export var spUR: Texture2D
@export var spUL: Texture2D
@export var spDR: Texture2D
@export var spDL: Texture2D
@export var spULD: Texture2D
@export var spRUL: Texture2D
@export var spDRU: Texture2D
@export var spLDR: Texture2D
@export var spUDRL: Texture2D



var grid_pos: Vector2
var type: int



var door_top: bool
var door_bot: bool
var door_left: bool
var door_right: bool


@export var normal_color: Color = Color.CORNSILK # Default color for rooms
@export var enter_color: Color = Color.CHARTREUSE  # Default color for starting room

@onready var sprite: Sprite2D = $Sprite2D

func _init(pos: Vector2 = Vector2.ZERO, room_type: int = 0) -> void:
	grid_pos = pos
	type = room_type

func _ready():
	pick_sprite()
	pick_color()

func pick_sprite():
	if door_top and door_bot and door_left and door_right:
		sprite.texture = spUDRL
	elif door_top and door_bot and door_left:
		sprite.texture = spULD
	elif door_top and door_bot and door_right:
		sprite.texture = spDRU
	elif door_top and door_left and door_right:
		sprite.texture = spRUL
	elif door_bot and door_left and door_right:
		sprite.texture = spLDR
	elif door_top and door_bot:
		sprite.texture = spUD
	elif door_left and door_right:
		sprite.texture = spRL
	elif door_top and door_right:
		sprite.texture = spUR
	elif door_top and door_left:
		sprite.texture = spUL
	elif door_bot and door_right:
		sprite.texture = spDR
	elif door_bot and door_left:
		sprite.texture = spDL
	elif door_top:
		sprite.texture = spU
	elif door_bot:
		sprite.texture = spD
	elif door_right:
		sprite.texture = spR
	elif door_left:
		sprite.texture = spL
	else:
		sprite.texture = null 

func pick_color():
	if type == 0:
		sprite.modulate = normal_color
	elif type == 1:
		sprite.modulate = enter_color
