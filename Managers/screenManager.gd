extends Sprite2D

@onready var menu_screen = $MenuScreen
@onready var game_screen = $GameScreen
@onready var credits_screen = $CreditsScreen
@onready var customize_screen = $CustomizeScreen

@onready var play_button = $MenuScreen/PlayButton
@onready var credits_button = $MenuScreen/CreditsButton

@onready var table = $"../../Table"

@onready var message_box:MessageBox = $MessageBox
@onready var buttons = $GameScreen/Buttons

var phrases_normal = ["The item you are looking for is ", "Hey, got any ", "Next up: ", "This needs some ", "My sensors indicate you need ", "We're doomed unless you add ", "Throw in some "]
var current_screen = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	set_screen("menu")
	menu_screen.visible = true
	pass # Replace with function body.

func _process(delta):
	if menu_screen.visible:
		message_box.set_text("Welcome to INFINITY BURGER!")
	if not game_screen.visible:
		table.position.y = 50	# lock autoscroll in place
	if customize_screen.visible:
		#set_message("Stylize your experience!")
		pass
	if credits_screen.visible:
		message_box.set_text("INFINITY BURGER was created for the Vertical Jam in 10 days!")


func set_message(message):
	message_box.rich_text_label.text = message
	
	
func _on_credits_button_button_down():
	print("Pressed Credits Button")
	set_screen("credits")
	pass # Replace with function body.


func _on_back_button_button_down():
	print("Pressed Back Button")
	set_screen("menu")
	pass # Replace with function body.


func _on_play_button_button_down():
	print("Pressed Play Button")
	set_screen("game")
	buttons.reset_items()
	buttons.button.spawn_starter_bun()
	pass # Replace with function body.


func _on_customize_button_button_down():
	print("Pressed Customize Button")
	set_screen("customize")
	message_box.set_text("Stylize your experience!")
	pass # Replace with function body.

func set_screen(screen):
	current_screen = screen
	
	menu_screen.visible = false
	credits_screen.visible = false
	game_screen.visible = false
	customize_screen.visible = false
	
	if current_screen == "menu":
		menu_screen.visible = true
		table.position.y = 50
	if current_screen == "game":
		game_screen.visible = true
	if current_screen == "customize":
		customize_screen.visible = true
	if current_screen == "credits":
		credits_screen.visible = true
