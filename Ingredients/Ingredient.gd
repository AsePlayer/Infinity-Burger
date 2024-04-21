extends Node2D
class_name Ingredient

# Define variables
@export var food_name:String = ""
@export var sprite:Texture
@export var value:float

var fall_speed = 1000  # Adjust the fall speed as needed

@onready var screen_manager = $"../../Tablet/Screen"

static var latest_ingredient:Ingredient

# Called when the node enters the scene tree for the first time.
func _ready():
	self.texture = sprite
	latest_ingredient = self
	pass # Replace with function body.

func _process(delta):
	if fall_speed <= 0: return # Falling down code
	# Update object's position to simulate falling
	position.y += fall_speed * delta

func _on_area_2d_area_entered(area):
	if area.is_in_group("camera"): return
	if area.is_in_group("deathzone") and latest_ingredient == self:
		screen_manager.game_over()
		print("GAME OVER")
		
	fall_speed = 0
	pass # Replace with function body.
