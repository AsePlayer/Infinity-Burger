extends Node2D

class_name Table

@onready var timer = $Plate/Area2D2/Timer
@onready var area_2d_2 = $Plate/Area2D2

@onready var ramp_up:float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ramp_up < 100:
		ramp_up = 10 + get_child_count()
	position.y += ramp_up * delta
	pass
