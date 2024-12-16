@tool
extends Button

static var group := ButtonGroup.new()

var is_correct := false

func _ready() -> void:
	button_group = group

func setup(description : String, correct : bool) -> void:
	text = description
	is_correct = correct

func select() -> void:
	set_pressed_no_signal(true)
