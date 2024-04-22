extends AudioStreamPlayer2D

class_name MusicPlayer
@onready var data = $"../Data"

var music:Array[AudioStream] = [preload("res://Music/UrbanFusion.ogg"),
preload("res://Music/Burger.ogg"),
preload("res://Music/Emoji.ogg"),
preload("res://Music/GettingHot.ogg"),
preload("res://Music/HotAndCool.ogg"),
preload("res://Music/BreakToFace.ogg"),
preload("res://Music/OldJoe.ogg"),
preload("res://Music/Retrosonic.ogg"),
preload("res://Music/SlowTension.ogg"),
preload("res://Music/StreetDash.ogg"),
preload("res://Music/SunsetGrooves.ogg")]

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = music[int(data.get_data("music"))]
	play()
	pass # Replace with function body.

func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	if mouse_button_index != 1:
		return
	
	print("clicked " + str(index))
	data.modify_data("music", index)
	stream = music[int(data.get_data("music"))]
	play()
	pass # Replace with function body.


func _on_finished():
	stream = music[int(data.get_data("music"))]
	play()
