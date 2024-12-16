extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/tipos_de_datos/tipos_de_datos.tres")

const CURRENT_LESSON := "tipos_de_datos"

const STRING := preload("res://addons/godot-course/lessons/tipos_de_datos/videos/string.ogv")
const INT := preload("res://addons/godot-course/lessons/tipos_de_datos/videos/int.ogv")
const FLOAT := preload("res://addons/godot-course/lessons/tipos_de_datos/videos/float.ogv")
const BOOLEAN := preload("res://addons/godot-course/lessons/tipos_de_datos/videos/boolean.ogv")

var datos_script := "res://GDScript/ejemplos/tipos_de_datos_ejemplos.gd"

func _build() -> void:
	init()
	intro()
	open_script()
	data_types()
	strings()
	integer()
	decimal()
	boolean()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_progress_value(5)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/tipos_de_datos.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Tipos de datos")
	bubble_add_text(
		["[center]En esta lección veremos los tipos de datos.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Tipos_de_datos"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Abrir script")
	bubble_add_text(
		["Abre el script para ver los ejemplos"]
	)
	bubble_add_task(
		"Presiona el botón " + bbcode_generate_icon_image_string(ICONS_MAP.script) + " para abrir el script.",
		false,
		1,
		func(task : Task) -> int:
			if not interface.is_in_scripting_context():
				return 0
			var current_script: String = EditorInterface.get_script_editor().get_current_script().resource_path
			return 1 if current_script == datos_script else 0,
	)
	complete_step()

func data_types() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Tipos de datos")
	bubble_add_text(
		["Las variables pueden almacenar varios tipos de datos.",
		"En este curso solo nos centraremos en los básicos."]
	)
	complete_step()

func strings() -> void:
	highlight_code(3, 3, 3, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("String")
	bubble_add_text(
		["Los strings son como una caja de letras y símbolos.",
		"Con las que puedes formar palabras, frases, entre otros."]
	)
	bubble_add_video(STRING)
	complete_step()

func integer() -> void:
	highlight_code(4, 4, 4, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Int")
	bubble_add_text(
		["Este tipo de dato es fácil de entender.",
		"Este representa a los números enteros."]
	)
	bubble_add_video(INT)
	complete_step()

func decimal() -> void:
	highlight_code(5, 5, 5, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Float")
	bubble_add_text(
		["Este también es fácil.",
		"Representa solo a los números decimales."]
	)
	bubble_add_video(FLOAT)
	complete_step()

func boolean() -> void:
	highlight_code(6, 6, 6, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Booleanos")
	bubble_add_text(
		["Este tipo de dato solo puede almacenar true(verdadero) o false(falso). Los booleanos son útiles para hacer operaciones lógicas."]
	)
	bubble_add_video(BOOLEAN)
	complete_step()

func complete_lesson() -> void:
	context_set_2d()
	bubble_set_background(FINISH_BACKGROUND)
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Fin de la lección")
	var is_lesson_completed : bool = Manager.data["lecciones"][CURRENT_LESSON]["completado"]
	if !is_lesson_completed:
		bubble_add_text(
			["[wave amp=50.0 freq=5.0 connected=1][b]¡Felicidades, has completado la lección![/b][/wave]"]
		)
	else:
		bubble_add_text(
			["[b]Gracias por repasar la lección.[/b]"]
		)
	complete_step()
