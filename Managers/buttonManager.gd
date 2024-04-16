extends Control

@onready var game_manager = get_owner().get_child(0)
@onready var kitchen:Kitchen = game_manager.get_child(0) as Kitchen

var available_items
var correct_item = 0
var correct_item_name = ""

@onready var button = $Button
@onready var button_2 = $Button2
@onready var button_3 = $Button3
@onready var button_4 = $Button4

# Called when the node enters the scene tree for the first time.
func _ready():
	available_items = kitchen.get_available_items().duplicate()
	reset_items()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_button(button:IngredientButton):
	var ingredient = available_items.pick_random() # Get random ingredient
	button.ingredient = ingredient
	button.icon = (ingredient.instantiate() as Ingredient).sprite # Change button icon
	available_items.remove_at(available_items.find(ingredient)) # Prevent duplicates


func reset_items():
	kitchen.reset_available_items()
	available_items = kitchen.get_available_items().duplicate()

	set_button(button)
	set_button(button_2)
	set_button(button_3)
	set_button(button_4)
	
	correct_item = randi_range(0,3)
	
	if correct_item == 0:
		correct_item_name = (((button as IngredientButton).ingredient.instantiate() as Ingredient).food_name)
	if correct_item == 1:
		correct_item_name = (((button_2 as IngredientButton).ingredient.instantiate() as Ingredient).food_name)
	if correct_item == 2:
		correct_item_name = (((button_3 as IngredientButton).ingredient.instantiate() as Ingredient).food_name)
	if correct_item == 3:
		correct_item_name = (((button_4 as IngredientButton).ingredient.instantiate() as Ingredient).food_name)
	print("Correct item = " + str(correct_item_name) + " or " + str(correct_item + 1))

func _on_button_button_down():
	if correct_item == 0:
		print("button_1 correct!")
	reset_items()
	pass # Replace with function body.


func _on_button_2_button_down():
	if correct_item == 1:
		print("button_2 correct!")
	reset_items()
	pass # Replace with function body.


func _on_button_3_button_down():
	if correct_item == 2:
		print("button_3 correct!")
	reset_items()
	pass # Replace with function body.


func _on_button_4_button_down():
	if correct_item == 3:
		print("button_4 correct!")
	reset_items()
	pass # Replace with function body.
