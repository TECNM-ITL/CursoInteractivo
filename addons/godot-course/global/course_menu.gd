@tool
extends CanvasLayer

signal start_lesson(lesson_path : String)

const ThemeUtils := preload("res://addons/godot-course/ui/theme_utils.gd")
const SelectableItem := preload("res://addons/godot-course/global/item.gd")
const EditorInterfaceAccess := preload("res://addons/godot-course/editor_interface_access.gd")
const Lesson := preload("res://addons/godot-course/lesson.gd")
const Overlays := preload("res://addons/godot-course/overlays/overlays.gd")

@onready var panel := %Panel
@onready var lesson_column := %LessonColumn
@onready var test_column := %TestColumn
@onready var lb_title := %Lb_title
@onready var panel_container := %PanelContainer
@onready var bt_close := %Bt_close
@onready var margin_container := %MarginContainer
@onready var bt_start := %Bt_start
@onready var sd_selection := %sd_selection
@onready var sd_denied := %sd_denied
@onready var sd_close := %sd_close
@onready var sd_upgrade := %sd_upgrade
@onready var sd_change := %sd_change
@onready var anim := %Anim
@onready var bt_prev := %Bt_prev
@onready var bt_next := %Bt_next

var lesson : Lesson = null
var overlays : Overlays = null
var editor_interface_access: EditorInterfaceAccess = null

func _ready() -> void:
	anim.play("gear")
	start_lesson.connect(start_selected_lesson)
	
	bt_start.pressed.connect(func emit_start_lesson() -> void:
		var selectable := get_item()
		if !selectable.lock:
			sd_selection.play()
			start_lesson.emit(selectable.lesson_path)
		else:
			sd_denied.play()
	)
	
	bt_close.pressed.connect(func emit_closed_and_free() -> void:
		sd_close.play()
		hide_menu()
	)
	
	if Engine.is_editor_hint():
		panel_container.custom_minimum_size.x *= EditorInterface.get_editor_scale()
		panel_container.custom_minimum_size.y *= EditorInterface.get_editor_scale() * 0.05
		bt_close.custom_minimum_size *= EditorInterface.get_editor_scale()
		for node: Control in [lb_title, bt_next, bt_prev, bt_start]:
			ThemeUtils.scale_font_size(node)
		ThemeUtils.scale_margin_container_margins(margin_container)
	
	if lesson_column.get_child_count() > 0:
		lesson_column.get_child(0).select()

func _exit_tree() -> void:
	if editor_interface_access != null:
		editor_interface_access.clean_up()
		overlays.clean_up()
		overlays.queue_free()

func start_selected_lesson(lesson_path : String) -> void:
	lesson = load(lesson_path).new(editor_interface_access, overlays)
	hide_menu()

func get_item() -> SelectableItem:
	return SelectableItem.group.get_pressed_button().owner

func setup() -> void:
	if editor_interface_access == null && overlays == null:
		editor_interface_access = EditorInterfaceAccess.new()
		overlays = Overlays.new(editor_interface_access)
		EditorInterface.get_base_control().add_child(overlays)

func show_menu() -> void:
	sd_upgrade.play()
	setup()
	update_exclamations()
	update_buttons()
	panel.show()

func hide_menu() -> void:
	lb_title.text = "Lecciones"
	bt_start.text = "EMPEZAR LECCIÓN"
	lesson_column.show()
	test_column.hide()
	panel.hide()

func update_buttons() -> void:
	var buttons := SelectableItem.group.get_buttons()
	for button in buttons:
		button.owner.set_ui_scale()
		button.owner.play_animation()
		button.owner.update_button()

func update_exclamations() -> void:
	bt_next.get_node("Exclamation").hide()
	bt_prev.get_node("Exclamation").hide()
	
	if lb_title.text == "Lecciones":
		for key in Manager.data["evaluaciones"]:
			if !Manager.data["evaluaciones"][key]["bloqueado"]:
				bt_next.get_node("Exclamation").show()
				bt_prev.get_node("Exclamation").show()
				break
	else:
		for key in Manager.data["lecciones"]:
			if !Manager.data["lecciones"][key]["bloqueado"] && !Manager.data["lecciones"][key]["completado"]:
				bt_next.get_node("Exclamation").show()
				bt_prev.get_node("Exclamation").show()
				break

func _on_change_list_pressed() -> void:
	sd_change.play()
	var tween := get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	lb_title.visible_ratio = 0.0
	lb_title.text = "Evaluaciones" if lesson_column.visible else "Lecciones"
	tween.tween_property(lb_title, "visible_ratio", 1.0, 1.0)
	bt_start.text = "EMPEZAR EVALUACIÓN" if lesson_column.visible else "EMPEZAR LECCIÓN"
	lesson_column.visible = !lesson_column.visible
	test_column.visible = !test_column.visible
	
	update_exclamations()
	get_item().deselect()
	
	if lesson_column.visible: lesson_column.get_child(0).select()
	else: test_column.get_child(0).select()
	
	update_buttons()
