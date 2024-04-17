extends Sprite2D

@onready var timer = $Area2D2/Timer
@onready var area_2d_2:Area2D = $Area2D2
@onready var ramp_up:float = 10

var viewport = get_viewport()
var plate_disabled:bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	viewport = get_viewport()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if plate_disabled: return
	if ramp_up < 100:
		ramp_up = 10 + get_parent().get_child_count()
	get_parent().position.y += ramp_up * delta
	pass
