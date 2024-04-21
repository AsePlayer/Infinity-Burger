extends Node2D
class_name Kitchen

@export var available_items:Array[PackedScene]
@export var all_items:Array[PackedScene]

@export var starter_items:Array[PackedScene]
@export var middle_items:Array[PackedScene]
@export var late_items:Array[PackedScene]

# Custom waves
@export var cheese_items:Array[PackedScene]
@export var sauce_items:Array[PackedScene]

var current_items:Array[PackedScene]

@onready var game_timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	current_items = starter_items
	available_items = current_items
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_available_items():
	return available_items

func reset_available_items():
	available_items = current_items
	return available_items

func start_game_timer():
	current_items = starter_items
	game_timer.start()
	pass
	
func stop_game_timer():
	game_timer.stop()



func _on_timer_timeout():
	if current_items == middle_items:
		current_items = late_items
		
	if current_items == starter_items:
		current_items = middle_items
	pass # Replace with function body.
