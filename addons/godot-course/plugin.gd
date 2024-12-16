@tool
extends EditorPlugin

const SINGLE_WINDOW_MODE_PROPERTY := "interface/editor/single_window_mode"
const AUTO_SAVE_SCRIPT := "text_editor/behavior/files/autosave_interval_secs"
const RESTORE_SCRIPTS := "text_editor/behavior/files/restore_scripts_on_load"

const EditorInterfaceAccess := preload("editor_interface_access.gd")
const BT_COURSE := preload("res://addons/godot-course/ui/menus/bt_course.tscn")
const BT_CONFIG := preload("res://addons/godot-course/ui/menus/bt_config.tscn")
const BT_HELP := preload("res://addons/godot-course/ui/menus/bt_help.tscn")
const WELCOME := preload("res://addons/godot-course/ui/menus/welcome.tscn")
const CONFIGURATION := preload("res://addons/godot-course/ui/menus/configuration.tscn")
const LOGIN_REGISTER := preload("res://addons/godot-course/ui/menus/login_register_menu.tscn")
const REGISTER_MENU := preload("res://addons/godot-course/ui/menus/register_menu.tscn")

var editor_interface_access: EditorInterfaceAccess = null
var top_bar_bt_course = null
var top_bar_bt_config = null
var top_bar_bt_help = null

func _enter_tree() -> void:
	add_autoload_singleton("CourseMenu", "res://addons/godot-course/global/course_menu.tscn")
	add_autoload_singleton("Manager", "res://addons/godot-course/global/manager.gd")
	
	# Hack for `EditorInterface.open_scene_from_path()`, see: https://github.com/godotengine/godot/issues/86869
	for _frame in range(10):
		await get_tree().process_frame
	
	await get_tree().physics_frame
	get_viewport().mode = Window.MODE_MAXIMIZED
	
	var editor_settings := EditorInterface.get_editor_settings()
	var is_single_window_mode := editor_settings.get_setting(SINGLE_WINDOW_MODE_PROPERTY)
	if not is_single_window_mode:
		editor_settings.set_setting(SINGLE_WINDOW_MODE_PROPERTY, true)
		editor_settings.set_setting(AUTO_SAVE_SCRIPT, 10)
		editor_settings.set_setting(RESTORE_SCRIPTS, false)
		EditorInterface.restart_editor()
	
	editor_interface_access = EditorInterfaceAccess.new()
	
	add_top_bar_buttons()
	show_welcome_menu()

func _exit_tree() -> void:
	remove_autoload_singleton("CourseMenu")
	remove_autoload_singleton("Manager")
	
	if top_bar_bt_course != null:
		top_bar_bt_course.queue_free()
		top_bar_bt_config.queue_free()
		top_bar_bt_help.queue_free()
	
	editor_interface_access.clean_up()

func add_top_bar_buttons() -> void:
	top_bar_bt_course = BT_COURSE.instantiate()
	top_bar_bt_config = BT_CONFIG.instantiate()
	top_bar_bt_help = BT_HELP.instantiate()
	
	top_bar_bt_course.setup()
	top_bar_bt_config.setup()
	top_bar_bt_help.setup()
	editor_interface_access.run_bar.add_sibling(top_bar_bt_course)
	editor_interface_access.run_bar.add_sibling(top_bar_bt_config)
	editor_interface_access.run_bar.add_sibling(top_bar_bt_help)
	top_bar_bt_course.get_parent().move_child(
		top_bar_bt_course, editor_interface_access.run_bar.get_index()
	)
	top_bar_bt_course.get_parent().move_child(
		top_bar_bt_config, editor_interface_access.run_bar.get_index()
	)
	top_bar_bt_course.get_parent().move_child(
		top_bar_bt_help, editor_interface_access.run_bar.get_index()
	)
	
	top_bar_bt_course.pressed.connect(show_welcome_menu)
	top_bar_bt_config.pressed.connect(show_configuration)

func show_configuration() -> void:
	var configuration = CONFIGURATION.instantiate()
	
	EditorInterface.get_base_control().add_child(configuration)
	configuration.setup()

func show_welcome_menu() -> void:
	var welcome_menu = WELCOME.instantiate()
	
	tree_exiting.connect(welcome_menu.queue_free)
	EditorInterface.get_base_control().add_child(welcome_menu)
	welcome_menu.setup()
	welcome_menu.login_register_menu.connect(show_login_register_menu)
	welcome_menu.register_menu.connect(show_register_menu)

func show_login_register_menu() -> void:
	var login_register_menu = LOGIN_REGISTER.instantiate()
	
	tree_exiting.connect(login_register_menu.queue_free)
	EditorInterface.get_base_control().add_child(login_register_menu)
	login_register_menu.setup()

func show_register_menu() -> void:
	var register_menu = REGISTER_MENU.instantiate()
	
	tree_exiting.connect(register_menu.queue_free)
	EditorInterface.get_base_control().add_child(register_menu)
	register_menu.setup()
