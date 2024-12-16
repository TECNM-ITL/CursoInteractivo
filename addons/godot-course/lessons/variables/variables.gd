extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg",
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/variables/variables.tres")

const CURRENT_LESSON := "variables"
const NEXT_LESSON := "constantes"
const PRACTICE := "practica_2"

const VARIABLES_VD := preload("res://addons/godot-course/lessons/variables/videos/variables.ogv")
const VARIABLES_IMG := preload("res://addons/godot-course/lessons/variables/imagenes/variables.png")

var script_hello := "res://GDScript/ejemplos/variables_ejemplo.gd"
var practice2 := "res://GDScript/practicas/practica_2.gd"

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	variable_syntax()
	variable_name()
	print_variable()
	run_code()
	output()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(5)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/variables.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Variables")
	bubble_add_text(
		["[center]En esta lección veremos las variables.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué son las variables?")
	bubble_add_text(
		["Las variables son como cajas donde puedes guardar información.",
		"Como números, palabras, entre otros."]
	)
	bubble_add_video(VARIABLES_VD)
	complete_step()

func open_script() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	highlight_scene_nodes_by_path(["Variables"])
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
			return 1 if current_script == script_hello else 0,
	)
	complete_step()

func variable_syntax() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Variables")
	bubble_add_text([
		"Para declarar una variable en GDScript necesitamos la siguiente sintaxis:"
	])
	bubble_add_texture(VARIABLES_IMG)
	complete_step()

func variable_name() -> void:
	highlight_code(3, 3, 2, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("ID")
	bubble_add_text([
		"[fill]La id es el nombre que quieras dar a la variable.[/fill]",
		"[fill]Para que así te sea más fácil de identificar.[/fill]"
	])
	complete_step()

func print_variable() -> void:
	highlight_code(6, 6, 5, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Imprimir variable")
	bubble_add_text([
		"[fill]Como en la lección de Hola mundo se imprimirá este mensaje.[/fill]",
		"[fill]Pero esta vez estamos almacenando este mensaje en una variable.[/fill]"
	])
	complete_step()

func run_code() -> void:
	highlight_controls([interface.run_bar_play_current_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Prueba el código")
	bubble_add_text(
		["[fill]Ahora ejecuta el código para que puedas observar el mensaje 'Hola mundo'.[/fill]"]
	)
	bubble_add_task_press_button(interface.run_bar_play_current_button, "Presiona el botón para ejecutar la escena")
	complete_step()

func output() -> void:
	tabs_set_to_index(interface.main_screen_tabs, 0)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.logger], true)
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Hola mundo")
	bubble_add_text(
		["[fill]Como puedes observar el mensaje 'Hola mundo' ya se encuentra en la salida.[/fill]"]
	)
	complete_step()
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = false
	)

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_2.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 2")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica2"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 2")
	bubble_add_text([
		"Abre el script para empezar con la práctica."
	])
	bubble_add_task(
		"Presiona el botón " + bbcode_generate_icon_image_string(ICONS_MAP.script) + " para abrir el script.",
		false,
		1,
		func(task : Task) -> int:
			if not interface.is_in_scripting_context():
				return 0
			var current_script: String = EditorInterface.get_script_editor().get_current_script().resource_path
			return 1 if current_script == practice2 else 0
	)
	complete_step()
	
	var user_name : String = Manager.data["nombre"].to_lower()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 2")
	bubble_add_task(
		"Crea una variable que contenga tu nombre e imprímela.",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var source_code : String = load(practice2).source_code.replace(" ", "")
			source_code = source_code.to_lower()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			if source_code.contains("var") && source_code.contains('="' + user_name + '"') && source_code.contains("print("):
				return 1
			return 0
	)
	bubble_add_task(
		"Ejecuta el código presionando " + bbcode_generate_icon_image_string(ICONS_MAP.play),
		true,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if EditorInterface.is_playing_scene() && total_errors == 0:
				bubble.code = load(practice2).source_code
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 2")
	bubble_add_text(
		["¡Bien hecho!."]
	)
	complete_step()
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = false
	)

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
