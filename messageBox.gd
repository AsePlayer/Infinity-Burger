extends MarginContainer

@onready var rich_text_label = $Message/RichTextLabel
@onready var buttons = $"../Buttons"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rich_text_label.text = "The item you are looking for is " + buttons.correct_item_name
	pass

# TODO Animate it like a tablet notification
