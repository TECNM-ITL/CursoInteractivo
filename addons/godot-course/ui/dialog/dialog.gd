@tool
extends Control

enum PopupMode {
	MESSAGE,
	CONFIRM,
	WARNING,
	HELP,
	ERROR
}

@onready var accept_dialog := $AcceptDialog
@onready var label : Label = $AcceptDialog.get_label()

func setup(text : String, mode : PopupMode, aligment : int) -> void:
	show()
	accept_dialog.dialog_text = text
	
	label.horizontal_alignment = aligment
	label.vertical_alignment = aligment
	
	match mode:
		PopupMode.MESSAGE:
			accept_dialog.title = "Aviso"
		PopupMode.CONFIRM:
			accept_dialog.title = "Confimar"
			accept_dialog.ok_button_text = "Sí"
			accept_dialog.add_cancel_button("No")
		PopupMode.HELP:
			accept_dialog.title = "Ayuda"
		PopupMode.ERROR:
			accept_dialog.title = "Error"

func _on_accept_dialog_canceled():
	queue_free()

func _on_accept_dialog_confirmed():
	queue_free()
