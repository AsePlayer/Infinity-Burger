extends Node2D

var json = JSON.new()
var path = "res://data.json"

var default_data = {
	"money": 0,
	"screen_color": 0,
	"screen_colors": [[1, false, 100],[2, false, 200],[3, false, 500],[4, false, 1000]]	
}
# Player's actual data
var save_data = default_data

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	modify_data("money", int(save_data["money"]) + 5)
	load_game()
	pass # Replace with function body.


func save_game():
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_line(json.stringify(save_data, "\t"))
	file.close()
	file = null


func load_game():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	save_data = content
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
