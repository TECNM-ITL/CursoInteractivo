extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")
const SINTAXIS_CONSTANTES := preload("res://addons/godot-course/lessons/constantes/imagenes/sintaxis(constantes).png")

const DIALOGUES = preload("res://addons/godot-course/lessons/constantes/constantes.tres")

const CURRENT_LESSON := "constantes"
const NEXT_LESSON := "tipos_de_datos"

var script_constantes := "res://GDScript/ejemplos/constantes_ejemplos.gd"

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	constant_syntax()
	example1()
	example2()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(3)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/constantes.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Constantes")
	bubble_add_text(
		["[center]En esta lección veremos las constantes.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["[fill]Una constante es un valor que no cambia durante la ejecución de un programa. Es como un dato fijo que estableces al inicio y que permanece igual todo el tiempo.[/fill]"]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Constantes"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Abrir script")
	bubble_add_text([
		"Abre el script para ver los ejemplos."
	])
	bubble_add_task(
		"Presiona el botón " + bbcode_generate_icon_image_string(ICONS_MAP.script) + " para abrir el script.",
		false,
		1,
		func(task : Task) -> int:
			if not interface.is_in_scripting_context():
				return 0
			var current_script: String = EditorInterface.get_script_editor().get_current_script().resource_path
			return 1 if current_script == script_constantes else 0,
	)
	complete_step()

func constant_syntax() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Constantes")
	bubble_add_text([
		"Para declarar una constante necesitamos la siguiente sintaxis:"
	])
	bubble_add_texture(SINTAXIS_CONSTANTES)
	complete_step()

func example1() -> void:
	highlight_code(3, 4, 3)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Constantes")
	bubble_add_text(["[fill]Estos son ejemplos de como declarar constantes en GDScript. Como puedes ver es recomendable que la id se escriba en mayúsculas aunque no es obligatorio.[/fill]"])
	complete_step()
	
	highlight_code(3, 4, 3)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_set_title("Constantes")
	bubble_add_text(["Puedes establecer como constante cualquier tipo de dato."])
	complete_step()

func example2() -> void:
	highlight_code(7, 9, 7)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_set_title("Constante literal")
	bubble_add_text(["Estos ejemplos son otro tipo de constante llamados [b]constantes literales[/b].",
	"Estos datos se utiliza directamente en el código sin la necesidad de asignar un id."])
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
			["[b]Buen repaso.[/b]"]
		)
	complete_step()
