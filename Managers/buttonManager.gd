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

@export var message_box:MessageBox
var phrases_normal = [
	"The item you are looking for is ",
	"Hey, got any ",
	"Next up: ",
	"This needs some ",
	"My sensors indicate you need ",
	"We're doomed unless you add ",
	"Throw in some ",
	"Looking for some ",
	"How about some ",
	"Need more ",
	"Consider adding ",
	"Let's include ",
	"What about ",
	"Could use a bit of ",
	"Don't forget ",
	"Time to add ",
	"Searching for ",
	"You're missing ",
	"Want some ",
	"In need of ",
	"Adding some ",
	"Try adding ",
	"A touch of ",
	"Perhaps some ",
	"Missing some ",
	"Don't overlook ",
	"Adding a dash of ",
	"Consider a bit of ",
	"Could use a hint of ",
	"How about a dollop of ",
	"Could benefit from ",
	"Why not try some ",
	"Could use some extra ",
	"What do you think about ",
	"Have you considered ",
	"Maybe try ",
	"What if we add ",
	"Don't neglect ",
	"Maybe a sprinkle of ",
	"Consider sprinkling some ",
	"What would happen with ",
	"You might enjoy ",
	"Why not throw in ",
	"Could use a sprinkle of ",
	"Perhaps a pinch of ",
	"Maybe a drop of ",
	"Don't miss out on ",
	"You might need ",
	"What do you think of adding ",
	"How about a touch of ",
	"What about mixing in ",
	"What about tossing in ",
	"Could use a hint of ",
	"Consider mixing in ",
	"How about mixing some ",
	"You could try mixing in ",
	"Why not mix in ",
	"Don't hesitate to add ",
	"Why not add a dash of ",
	"Consider tossing in ",
	"Don't forget to add ",
	"Try tossing in ",
	"You need to toss in ",
	"Don't forget about ",
	"Why not try tossing in ",
	"Don't overlook the ",
	"Add a pinch of ",
	"What if we mix in ",
	"What about adding some ",
	"How about a dash of ",
	"Don't forget to mix in ",
	"Try adding a dash of ",
	"Have you tried mixing in ",
	"Consider a dollop of ",
	"Maybe toss in ",
	"Why not add some ",
	"Consider adding a sprinkle of ",
	"Why not add a drop of ",
	"How about sprinkling in ",
	"Try adding a pinch of ",
	"What about adding a hint of ",
	"Why not mix some ",
	"Consider mixing some ",
	"Try mixing in ",
	"Don't overlook adding ",
	"Why not sprinkle in ",
	"How about a dollop of ",
	"What if we add some ",
	"Why not sprinkle in some ",
	"Consider tossing in some ",
	"Try adding a hint of ",
	"How about adding a drop of ",
	"Consider a drop of ",
	"What about a hint of ",
	"How about a sprinkle of ",
	"Consider adding some ",
	"Don't forget to toss in ",
	"What if we toss in ",
	"Don't miss out on adding ",
	"Maybe a dash of ",
	"Why not toss in ",
	"What about a dollop of ",
	"Don't forget a touch of ",
	"Consider a sprinkle of ",
	"What if we sprinkle in ",
	"Why not sprinkle a bit of ",
	"Consider adding a dash of ",
	"Try tossing some ",
	"How about a pinch of ",
	"Maybe sprinkle some ",
	"Why not mix a bit of ",
	"Try tossing a bit of ",
	"Consider mixing a bit of ",
	"Don't miss the chance to add ",
	"Why not toss a bit of ",
	"Don't forget a dollop of ",
	"What about mixing a bit of ",
	"Don't forget to sprinkle in ",
	"Try adding a sprinkle of ",
	"Consider adding a pinch of ",
	"Maybe mix a bit of ",
	"Why not sprinkle a hint of ",
	"What about mixing a hint of ",
	"Don't overlook the possibility of adding ",
	"Try adding a dollop of ",
	"Don't forget to mix some ",
	"Why not add a hint of ",
	"What about tossing a bit of ",
	"Maybe add a hint of ",
	"Why not add a touch of ",
	"Consider adding a drop of ",
	"Don't forget to sprinkle some ",
	"Try adding a touch of ",
	"Consider adding a touch of ",
	"What about a sprinkle ",
	"Maybe toss a bit of ",
	"Don't miss the opportunity to add ",
	"Why not mix in some ",
	"What if we add a hint of ",
	"Why not add a sprinkle of ",
	"Try adding a hint ",
	"Why not sprinkle a touch of ",
	"Consider tossing a hint of ",
	"What about tossing a hint of ",
	"Don't overlook a hint of ",
	"What about mixing a touch of ",
	"Why not toss a hint of ",
	"Consider tossing a touch of ",
	"Try tossing a touch of ",
	"Why not mix a touch of ",
	"Try mixing a touch of ",
	"Consider mixing a touch of ",
	"Consider adding a touch ",
	"Why not mix a hint of ",
	"What if we mix a hint of ",
	"What if we mix a touch of ",
	"Consider tossing a dollop of ",
	"Consider tossing a sprinkle of ",
	"Why not toss a sprinkle of ",
	"What if we toss a sprinkle of ",
	"Don't overlook tossing a sprinkle of ",
	"Don't miss tossing a sprinkle of ",
	"What if we add a sprinkle of ",
	"What if we add a touch of ",
	"Don't forget to add a sprinkle of ",
	"Consider tossing a touch ",
	"Why not toss a touch ",
	"Why not add a touch ",
	"Consider adding a touch of ",
	"Don't forget a touch ",
	"Try adding a sprinkle ",
	"Consider tossing a sprinkle ",
	"Consider tossing a dash of ",
	"What if we toss a dash of ",
	"Why not toss a dash of ",
	"What if we add a dash of ",
	"Don't overlook adding a dash of ",
	"Don't miss adding a dash of "
	]
# Called when the node enters the scene tree for the first time.
func _ready():
	#available_items = kitchen.get_available_items().duplicate()
	reset_items()
	pass # Replace with function body.

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
	print("Correct item = " + str(correct_item_name) + " or button #" + str(correct_item + 1))
	
	message_box.set_text(phrases_normal.pick_random() + correct_item_name)
	


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
