extends Sprite2D

@onready var menu_screen = $MenuScreen
@onready var game_screen = $GameScreen
@onready var credits_screen = $CreditsScreen
@onready var customize_screen = $CustomizeScreen
@onready var game_over_screen = $GameOverScreen
@onready var login_screen = $LoginScreen
@onready var line_edit = $LoginScreen/LineEdit
@onready var music_screen = $MusicScreen


@onready var play_button = $MenuScreen/PlayButton
@onready var credits_button = $MenuScreen/CreditsButton

@onready var table = $"../../Table"

@onready var message_box:MessageBox = $MessageBox
@onready var buttons = $GameScreen/Buttons
@onready var data = $"../../GameManager/Data"

var current_screen = ""

var in_game = false

@onready var kitchen = $"../../GameManager/Kitchen"


# Leaderboard stuff
@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup username for first time player, check for default "BurgerBoi"
	if data.get_data("name") == "BurgerBoi":
		set_screen("login")
	else:
		set_screen("menu")
	
	# Leaderboard Stuff
	SilentWolf.configure({
		"api_key": "3tlwQQ11PD1d1HgxNdM1B91WOk0EGNnb7paCxeDY",
		"game_id": "InfinityBurger1",
		"log_level": 1
	  })

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://main.tscn"
	  })
	

func _process(delta):
	if not game_screen.visible:
		if table.position.y > 50:
			table.position.y -= 0.5
		else:
			table.position.y = 50	# lock autoscroll in place
	if customize_screen.visible:
		#set_message("Stylize your experience!")
		pass
	if credits_screen.visible:
		message_box.set_text("INFINITY BURGER was created for the Vertical Jam in 10 days!")

func game_over():
	kitchen.stop_game_timer()
	
	SilentWolf.Scores.save_score(data.get_data("name"), buttons.points) # to save score online
	buttons.button.spawn_exit_bun()
	in_game = false
	data.save_game()
	
	var tips = ["You lose points if you purchase the wrong ingredient!", 
	"You can spam ingredients to recover lost ground… at a price", 
	"The infinity burger's value is based on following the AI’s recipe",
	"Once the burger hits the bottom of the screen, it's game over!",
	"See how you stack up to the competition in the leaderboard!",
	"Don't deviate from the recipe",
	"Don't drink and drive"]
	
	message_box.set_text("TIP: " + tips.pick_random())
	set_screen("game_over")
	



func set_message(message):
	message_box.rich_text_label.text = message
	
	
func _on_credits_button_button_down():
	print("Pressed Credits Button")
	set_screen("credits")
	pass # Replace with function body.

func _on_rename_button_button_down():
	set_screen("login")
	line_edit.text = data.get_data("name")
	pass # Replace with function body.


func _on_back_button_button_down():
	if in_game:
		game_over()
	else:
		data.save_game()
		set_screen("menu")


func _on_play_button_button_down():
	print("Pressed Play Button")
	table.position.y = 50	# lock autoscroll in place
	set_screen("game")
	kitchen.start_game_timer()
	buttons.reset_items()
	buttons.button.spawn_starter_bun()
	# Remove previous burger
	for t in table.get_children():
		if t.name != "Plate":
			t.queue_free()
	
	in_game = true
	pass # Replace with function body.


func _on_customize_button_button_down():
	print("Pressed Customize Button")
	set_screen("customize")
	message_box.set_text("Choose your background!")
	pass # Replace with function body.

func set_screen(screen):
	current_screen = screen
	
	menu_screen.visible = false
	game_screen.visible = false
	game_over_screen.visible = false
	customize_screen.visible = false
	credits_screen.visible = false
	login_screen.visible = false
	music_screen.visible = false
	
	if current_screen == "menu":
		menu_screen.visible = true
		message_box.set_text("Welcome to INFINITY BURGER, " + data.get_data("name") + "!")
	if current_screen == "game":
		game_screen.visible = true
	if current_screen == "game_over" or current_screen == "gameover":
		game_over_screen.visible = true
	if current_screen == "customize":
		customize_screen.visible = true
	if current_screen == "credits":
		credits_screen.visible = true
	if current_screen == "login":
		login_screen.visible = true
		message_box.set_text("I'm Burger Buddy A.I.! What's your name?")
	if current_screen == "music":
		message_box.set_text("Choose a track to inspire the perfect Infinity Burger!")
		music_screen.visible = true
		pass

func _on_leaderboard_button_pressed():
	get_tree().change_scene_to_packed(leaderboard_scene)

func _on_music_button_button_down():
	set_screen("music")
	pass # Replace with function body.
	

func _on_play_button_mouse_entered():
	message_box.set_text("Play the game and build a legendary Infinity Burger!")


func _on_leaderboard_button_mouse_entered():
	message_box.set_text("See how you stack up against the competition in the leaderboard!")


func _on_credits_button_mouse_entered():
	message_box.set_text("Credits and attributions!")


func _on_customize_button_mouse_entered():
	message_box.set_text("Stylize your experience!")


func _on_how_to_play_button_mouse_entered():
	message_box.set_text("How to play: Click/tap buttons on the tablet to follow Burger Buddy A.I.'s perfect instructions!")
	pass # Replace with function body.


func _on_login_button_button_down():
	data.modify_data("name", line_edit.text)
	set_screen("menu")
	pass # Replace with function body.


func _on_rename_button_mouse_entered():
	message_box.set_text("Change your name into something far greater.")
	pass # Replace with function body.


func _on_music_button_mouse_entered():
	message_box.set_text("Change yo tunes!")
