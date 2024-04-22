extends MarginContainer

class_name MessageBox

@onready var rich_text_label = $Message/RichTextLabel
@onready var animation_player = $AnimationPlayer

var current_text
var next_text

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Animates messages like a tablet notification
func set_text(text):
	if text == current_text: return # Prevent spamming same text
	# Load next text
	next_text = text
	animation_player.play("notif_up")
	pass

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "notif_up":
		visible = true
		current_text = next_text
		rich_text_label.text = current_text
		animation_player.play("notif_down")
