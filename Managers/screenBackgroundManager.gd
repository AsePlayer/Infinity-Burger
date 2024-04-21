extends ItemList
@export var screen:Sprite2D
@export var game_data:Node2D

var confirm_purchase = false

# Called when the node enters the scene tree for the first time.
func _ready():
	select(int(game_data.get_data("screen_color"))) # select current background on file
	screen.texture = get_item_icon(int(game_data.get_data("screen_color")))
	pass # Replace with function body.

func _on_item_clicked(index, at_position, mouse_button_index):
	var purchases = game_data.get_data("screen_colors")
	print(purchases)
	if confirm_purchase:
		# Purchase logic
		print("Purchased item?")
		pass
		
	if not confirm_purchase:
		confirm_purchase = true
		print("Item not purchased.")
		# Send notification with the price
		# if money > game_data.get_data("screen_color_unlocks"[index]):
		pass
		
	
	game_data.modify_data("screen_color", index)
	screen.texture = get_item_icon(index)
	pass # Replace with function body.


func _on_item_selected(index):
	print(index)
	pass # Replace with function body.
