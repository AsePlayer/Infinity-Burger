extends Node2D

var json = JSON.new()
var path = "res://data.json"

var default_data = {
	"player_position": 0,
	"game_progress": 0,
	"unlocks": [[1, false],[2, false],[3, false],[4, false]]	
}
# Player's actual data
var save_data = default_data
# Called when the node enters the scene tree for the first time.
func _ready():

	save_game(save_data)
	load_game()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func save_game(data):
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_line(json.stringify(data, "\t"))
	file.close()
	file = null

func load_game():
	var file = FileAccess.open(path, FileAccess.READ)
	var content = json.parse_string(file.get_as_text())
	save_data = content
	print(save_data)
	return content
	
func reset_data():
	save_game(default_data)
