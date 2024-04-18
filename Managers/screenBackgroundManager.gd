extends ItemList
@export var screen:Sprite2D
@export var game_data:Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	get_selected_items()
	select(int(game_data.get_data("screen_color")))
	screen.texture = get_item_icon(int(game_data.get_data("screen_color")))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_clicked(index, at_position, mouse_button_index):
	game_data.modify_data("screen_color", index)
	screen.texture = get_item_icon(index)
	pass # Replace with function body.


func _on_item_selected(index):
	pass # Replace with function body.
