extends Node2D

var json = JSON.new()
var path = "res://data.json"

@onready var buttons = $"../../Tablet/Screen/GameScreen/Buttons"

var default_data = {
	"money": 0,
	"screen_color": 0,
	"music": "default",
	"name": "BurgerBoi",
	"screen_colors": [[0, false, 100],[1, false, 200],[2, false, 500],[3, false, 1000],[4, false, 1000],[5, false, 1000]]	
}
# Player's actual data
var save_data = default_data

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	pass # Replace with function body.


func save_game():
	var file = FileAccess.open(path, FileAccess.WRITE)
	save_data["money"] += buttons.points
	print("added this many points to save: " + str(buttons.points))
	buttons.points = 0
	buttons.dollars_for_burger.text = "[center]%s[/center]" % ("$0")
	file.store_line(json.stringify(save_data, "\t"))
	file.close()
	file = null
	load_game()


func load_game():
	var file = FileAccess.open(path, FileAccess.READ)
	if file == null:
		save_game() # No save file exists. Save with default data
		file = FileAccess.open(path, FileAccess.READ)
		
	var content = json.parse_string(file.get_as_text())
	save_data = content
	
	buttons.dollars_total.text = "[center]%s[/center]" % ("$" + str(save_data["money"]))
	print(save_data)
	return content
	
	
func reset_data():
	save_data = default_data
	save_game()


func modify_data(key, value):
	save_data[str(key)] = value
	save_game()
	print("Modified " + str(key) + " with value: " + str(value))
	pass

func get_data(key):
	return save_data[str(key)]
