extends Sprite2D

@onready var menu_screen = $MenuScreen
@onready var game_screen = $GameScreen
@onready var credits_screen = $CreditsScreen

@onready var play_button = $MenuScreen/PlayButton
@onready var credits_button = $MenuScreen/CreditsButton


# Called when the node enters the scene tree for the first time.
func _ready():
	menu_screen.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_credits_button_button_down():
	print("Pressed Credits Button")
	menu_screen.visible = false
	credits_screen.visible = true
	game_screen.visible = false
	pass # Replace with function body.


func _on_back_button_button_down():
	print("Pressed Back Button")
	menu_screen.visible = true
	credits_screen.visible = false
	game_screen.visible = false
	pass # Replace with function body.


func _on_play_button_button_down():
	print("Pressed Play Button")
	menu_screen.visible = false
	credits_screen.visible = false
	game_screen.visible = true
	pass # Replace with function body.
