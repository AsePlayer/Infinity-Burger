extends Node2D
class_name Ingredient

# Define variables
@export var food_name:String = ""
@export var sprite:Texture
@export var value:int
var fall_speed = 1000  # Adjust the fall speed as needed

# Food Attributes (this will be used for more complex game logic later)
@export var isMeat:bool
@export var isDairy:bool
@export var isGarnish:bool
@export var isSauce:bool
@export var isFruit:bool # Ultimate curveball. Seeds = fruit

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = sprite
	pass # Replace with function body.

func _process(delta):
	if fall_speed <= 0: return # Falling down code
	# Update object's position to simulate falling
	position.y += fall_speed * delta

func _on_area_2d_area_entered(area):
	if area.is_in_group("camera"): return
	fall_speed = 0
	pass # Replace with function body.
