extends Node2D

class_name Table

@onready var timer = $Plate/Area2D2/Timer
@onready var area_2d_2 = $Plate/Area2D2


@onready var ramp_up:float = 10

@onready var background_node = $"../BackgroundNode"
var background_node_og_position
var table_node_og_position

@export var screen_manager:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	background_node_og_position = background_node.global_position
	table_node_og_position = global_position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if screen_manager.in_game == false and abs(table_node_og_position.y - global_position.y) > 5: 
		background_node.position.y -= ramp_up * delta
		return
	
	if screen_manager.in_game == false: return
	
	if ramp_up < 100:
		ramp_up = 5 + get_child_count() / 3
			
	position.y += ramp_up * delta
	background_node.position.y += ramp_up * delta
	pass
