@tool
extends CanvasLayer

@onready var bt_login := %Bt_login
@onready var bt_register := %Bt_register
@onready var sd_click := %sd_click

const LOGIN_MENU = preload("res://addons/godot-course/ui/menus/login_menu.tscn")
const REGISTER_MENU = preload("res://addons/godot-course/ui/menus/register_menu.tscn")

func setup() -> void:
	bt_login.pressed.connect(func show_login_menu() -> void:
		sd_click.play()
		await sd_click.finished
		show_login_menu()
		queue_free()
	)
	
	bt_register.pressed.connect(func show_register_menu() -> void:
		sd_click.play()
		await sd_click.finished
		show_register_menu()
		queue_free()
	)

func show_login_menu() -> void:
	var login_menu := LOGIN_MENU.instantiate()
	EditorInterface.get_base_control().add_child(login_menu)
	login_menu.setup()

func show_register_menu() -> void:
	var register_menu := REGISTER_MENU.instantiate()
	EditorInterface.get_base_control().add_child(register_menu)
	register_menu.setup()
