extends Button
class_name IngredientButton

@export var ingredient:PackedScene
@export var spawn_point:Node2D
@export var table:Node2D
@onready var delay_timer = $"../Timer"

static var z_depth = 0
static var queue:Array = []
static var ingredient_size = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if delay_timer.is_stopped() and queue.size() > 0:
		table.add_child(queue[0])
		
		# Adjust position in the world
		z_depth += 1
		queue[0].z_index = z_depth
		queue[0].global_position = spawn_point.global_position
		
		# Remove from queue and start delay timer
		queue.remove_at(0)
		delay_timer.start()
	pass

func _on_button_down():
	var scene = ingredient.instantiate()
	queue.append(scene)
	pass # Replace with function body.
