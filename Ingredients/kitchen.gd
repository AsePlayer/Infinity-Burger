extends Node2D
class_name Kitchen

@export var items:Array[PackedScene]
@export var available_items:Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready():
	available_items = items
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_available_items():
	return available_items

func reset_available_items():
	available_items = items
	return available_items
