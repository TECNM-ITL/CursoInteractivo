@tool
extends PanelContainer

@onready var bubble := $"../../../../.."

const DIALOG = preload("res://addons/godot-course/ui/dialog/dialog.tscn")

const PATH_SOLVED := "res://addons/godot-course/bubble/task/solved/"
const PATH_TIPS := "res://addons/godot-course/bubble/task/tips/"

var message : Control

func open_file(path) -> String:
	var file := FileAccess.open(path + bubble.practice, FileAccess.READ)
	var result := file.get_as_text()
	file.close()
	return result

func _on_bt_help_pressed():
	var tip := open_file(PATH_TIPS)
	message = DIALOG.instantiate()
	EditorInterface.get_base_control().add_child(message)
	message.setup(tip, 3, HORIZONTAL_ALIGNMENT_FILL)
	message.accept_dialog.confirmed.connect(_on_confirm_help_dialog)
	message.accept_dialog.canceled.connect(_on_cancel_help_dialog)

func _on_bt_solution_pressed() -> void:
	message = DIALOG.instantiate()
	EditorInterface.get_base_control().add_child(message)
	message.setup("¿Estas seguro de ver la solución?", 1, HORIZONTAL_ALIGNMENT_CENTER)
	message.accept_dialog.confirmed.connect(_on_confirm_message_dialog)
	message.accept_dialog.canceled.connect(_on_cancel_message_dialog)

func _on_confirm_help_dialog() -> void:
	Manager.data["practicas"][bubble.practice]["ayuda"] = true
	Manager.save_user()
	message.queue_free()

func _on_cancel_help_dialog() -> void:
	message.queue_free()

func _on_confirm_message_dialog() -> void:
	Manager.data["practicas"][bubble.practice]["solucion"] = true
	Manager.save_user()
	message.queue_free()
	bubble.clear()
	var code := open_file(PATH_SOLVED)
	if bubble.practice.contains("1") || bubble.practice.contains("2"):
		code = code.replace("MiNombre", Manager.data.nombre)
	var codes : Array[String] = [code]
	var text : Array[String] = ["Esta es una posible solución a la práctica."]
	
	bubble.add_text(text)
	bubble.add_code(codes)

func _on_cancel_message_dialog() -> void:
	message.queue_free()
