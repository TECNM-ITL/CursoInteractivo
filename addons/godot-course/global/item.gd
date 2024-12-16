@tool
extends PanelContainer

const LOCK_ICON := preload("res://addons/godot-course/ui/icons/lock.svg")
const ThemeUtils := preload("res://addons/godot-course/ui/theme_utils.gd")

enum Ids {
	que_es_godot,
	editor_tour,
	nodos,
	hola_gdscript,
	variables,
	constantes,
	tipos_de_datos,
	funciones,
	operadores,
	condicionales,
	ciclos,
	listas,
	errores,
	proyecto,
	jugador_escena,
	programar_jugador,
	creando_enemigo,
	escena_principal,
	interfaz_usuario,
	finalizando,
	prueba_1,
	prueba_2,
	prueba_3
}

@export_file("*.gd") var lesson_path : String
@export var title := "Desconocido"
@export var item_id := Ids.que_es_godot
@export var icon : Texture2D
@export var anim_delay := 0.0
@export var evaluation_mode := false

@onready var margin_container := $MarginContainer
@onready var button := %Button
@onready var icon_tex := %Icon
@onready var lb_state := %Lb_state
@onready var lb_title := %Lb_title
@onready var exclamation := %Exclamation
@onready var anim := %Anim

static var group := ButtonGroup.new()

var lock := true

var is_scaled := false

func _ready() -> void:
	lb_title.text = title
	button.button_group = group

func set_ui_scale() -> void:
	if Engine.is_editor_hint() && !is_scaled:
		is_scaled = true
		var editor_scale := EditorInterface.get_editor_scale()
		for node: Control in [lb_title, lb_state]:
			ThemeUtils.scale_font_size(node)
		
		ThemeUtils.scale_margin_container_margins(margin_container)

func update_button() -> void:
	var id : String = Manager.ITEMS_ID[item_id]
	if !evaluation_mode:
		lock = Manager.data["lecciones"][id]["bloqueado"]
		if lock:
			icon_tex.texture = LOCK_ICON
			lb_state.text = "⬤ Bloqueado"
			lb_state.add_theme_color_override("font_color", Color.BLACK)
		else:
			var is_completed : bool = Manager.data["lecciones"][id]["completado"]
			icon_tex.texture = icon
			if is_completed:
				exclamation.hide()
				lb_state.text = "✔ Completado"
				lb_state.add_theme_color_override("font_color", Color.DARK_GREEN)
			else:
				exclamation.show()
				lb_state.text = "❌ No completado"
				lb_state.add_theme_color_override("font_color", Color.DARK_RED)
	else:
		lock = Manager.data["evaluaciones"][id]["bloqueado"]
		var index = Manager.data["evaluaciones"][id]["puntuaciones"].size() - 1.0
		var current_qualification : float = Manager.data["evaluaciones"][id]["puntuaciones"][index] if !Manager.data["evaluaciones"][id]["puntuaciones"].is_empty() else 0
		if lock:
			icon_tex.texture = LOCK_ICON
			if current_qualification == 100:
				exclamation.hide()
				lb_state.text = "✔ Completado"
				lb_state.add_theme_color_override("font_color", Color.DARK_GREEN)
			else:
				lb_state.text = "⬤ Bloqueado"
				lb_state.add_theme_color_override("font_color", Color.BLACK)
		else:
			icon_tex.texture = icon
			exclamation.show()
			if Manager.data["evaluaciones"][id]["puntuaciones"].is_empty():
				lb_state.text = "❌ No completado"
				lb_state.add_theme_color_override("font_color", Color.DARK_RED)
			elif current_qualification >= 70 && current_qualification < 100:
				lb_state.text = "✔" + str(current_qualification)
				lb_state.add_theme_color_override("font_color", Color.DARK_GREEN)
			elif current_qualification < 70:
				lb_state.text = "❌" + str(current_qualification)
				lb_state.add_theme_color_override("font_color", Color.DARK_RED)

func play_animation() -> void:
	anim.play("RESET")
	await get_tree().create_timer(anim_delay).timeout
	anim.play("appear")

func select() -> void:
	button.set_pressed_no_signal(true)

func deselect() -> void:
	button.set_pressed_no_signal(false)
