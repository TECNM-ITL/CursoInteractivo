@tool
extends CanvasLayer

signal start
signal login_register_menu
signal register_menu
signal closed

@onready var lb_title := %Lb_title
@onready var rich_text_lb := $Panel/PanelContainer/MarginContainer/VBoxContainer/RichTextLabel
@onready var bt_start := %Bt_start
@onready var bt_close := %Bt_close
@onready var panel_container := %PanelContainer
@onready var margin_container := %MarginContainer
@onready var logo := %Logo
@onready var load := %load
@onready var sd_start := %sd_start
@onready var sd_close := %sd_close
@onready var http_request := $HTTPRequest

const ThemeUtils := preload("res://addons/godot-course/ui/theme_utils.gd")

func setup() -> void:
	EditorInterface.get_open_scenes().clear()
	http_request.request("https://www.google.com/")
	await http_request.request_completed
	Manager.load_user()
	Manager.run(["update_user"], true)
	
	start.connect(on_start)
	
	bt_close.pressed.connect(func emit_closed_and_free() -> void:
		sd_close.play()
		await sd_close.finished
		closed.emit()
		queue_free()
	)
	
	bt_start.pressed.connect(func emit_start_course() -> void:
		bt_close.disabled = true
		bt_start.disabled = true
		sd_start.play()
		logo.godot_wink()
		await get_tree().create_timer(3.0).timeout
		start.emit()
		queue_free()
	)
	
	if Engine.is_editor_hint():
		panel_container.custom_minimum_size.x *= EditorInterface.get_editor_scale()
		panel_container.custom_minimum_size.y *= EditorInterface.get_editor_scale() * 0.85
		bt_close.custom_minimum_size *= EditorInterface.get_editor_scale()
		logo.get_node("Icon").scale *= EditorInterface.get_editor_scale()
		logo.get_node("Eyes").scale *= EditorInterface.get_editor_scale()
		for node: Control in [lb_title, rich_text_lb, bt_start]:
			ThemeUtils.scale_font_size(node)
		ThemeUtils.scale_margin_container_margins(margin_container)

func on_start() -> void:
	if Manager.user_exists():
		Manager.load_user()
		if Manager.connected && Manager.data["email"].is_empty():
			register_menu.emit()
			return
		CourseMenu.show_menu()
	else:
		Manager.reset_data()
		if !Manager.connected:
			register_menu.emit()
			return
		login_register_menu.emit()

func _on_http_request_request_completed(result, response_code, headers, body):
	load.load_state(response_code)
	await get_tree().create_timer(1.0).timeout
	load.hide()
	panel_container.show()
