extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/funciones/funciones.tres")

const CURRENT_LESSON := "funciones"
const NEXT_LESSON := "operadores"
const PRACTICE := "practica_3"

const FUNCI_N := preload("res://addons/godot-course/lessons/funciones/imagenes/función.png")
const FUNCI_N_1 = preload("res://addons/godot-course/lessons/funciones/imagenes/función1.png")
const FUNCI_N_2 = preload("res://addons/godot-course/lessons/funciones/imagenes/función2.png")
const FUNCI_N_3 = preload("res://addons/godot-course/lessons/funciones/imagenes/función3.png")

var script_funciones := "res://GDScript/ejemplos/funciones_ejemplos.gd"
var practice3 := "res://GDScript/practicas/practica_3.gd"

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	ready_function()
	declare_functions()
	parameters()
	built_in_functions()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(4)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/funciones.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Funciones")
	bubble_add_text(
		["[center]En esta lección veremos las funciones.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Funciones"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Abrir script")
	bubble_add_task(
		"Presiona el botón " + bbcode_generate_icon_image_string(ICONS_MAP.script) + " para abrir el script.",
		false,
		1,
		func(task : Task) -> int:
			if not interface.is_in_scripting_context():
				return 0
			var current_script: String = EditorInterface.get_script_editor().get_current_script().resource_path
			return 1 if current_script == script_funciones else 0,
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es una función?")
	bubble_add_text(
		["Es un bloque de código para realizar tareas especificas.",
		"Permitiendo tener una mejor organización en el código."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_set_title("¿Qué es una función?")
	bubble_add_text(
		["El siguiente diagrama es un diagrama de flujo que muestra un ejemplo simple de una función."]
	)
	bubble_add_texture(FUNCI_N_1)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es una función?")
	bubble_add_text(
		["El siguiente diagrama de flujo muestra un ejemplo de una función que recibe parámetros."]
	)
	bubble_add_texture(FUNCI_N_2)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es una función?")
	bubble_add_text(
		["El siguiente diagrama de flujo muestra un ejemplo de una función que recibe parámetros y devuelve un valor."]
	)
	bubble_add_texture(FUNCI_N_3)
	complete_step()

func ready_function() -> void:
	highlight_code(3, 3, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("_ready()")
	bubble_add_text(
		["Ya habrás notado este código en anteriores lecciones.",
		"Esto es una función virtual del motor Godot."]
	)
	complete_step()
	
	highlight_code(3, 3, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("_ready()")
	bubble_add_text(
		["Este será llamado cuando el nodo ya se encuentre en la escena.",
		"Permitiendo poder ejecutar código al inicio del juego."]
	)
	complete_step()

func declare_functions() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Declarar funciones")
	bubble_add_text(
		["Para declarar una función en GDScript necesitamos la siguiente estructura:"]
	)
	bubble_add_texture(FUNCI_N)
	complete_step()
	
	highlight_code(8, 14, 8)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Ejemplo")
	bubble_add_text(
		["[fill]Como primer ejemplo tenemos esta función que separa un [b]String[/b] por espacios con el método [b]split()[/b].[fill]"]
	)
	complete_step()
	
	highlight_code(4, 4, 3)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Llamar función")
	bubble_add_text(
		["Y para llamarlo únicamente colocamos su nombre seguido de ()."]
	)
	complete_step()

func parameters() -> void:
	highlight_code(16, 17, 15)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Parametros")
	bubble_add_text(
		["[fill]El siguiente ejemplo es una función con un parámetro declarado, lo que hace es retornar con la palabra reservada [b]return[/b] el número de caracteres usando el método [b]len()[/b].[/fill]",
		"[fill]En una función puedes declarar todos los parámetros que quieras.[/fill]"]
	)
	complete_step()
	
	highlight_code(19, 20, 18)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Parametros")
	bubble_add_text(
		["[fill]Por último en este ejemplo la función retorna la suma de dos parámetros. Observa cómo podemos llamar a la función dentro de sí misma; a esto se le llama recursión.[/fill]"]
	)
	complete_step()
	
	highlight_code(5, 5, 4)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Impimir")
	bubble_add_text(
		["[fill]Al momento de llamar la función debes pasarle todos los parámetros declarados.[/fill]",
		"Pueden ser variables o constantes."]
	)
	complete_step()

func built_in_functions() -> void:
	highlight_code(6, 6, 5)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Impimir")
	bubble_add_text(
		["[fill]Quizás ya te has dado cuenta de que [b]print()[/b] es una función y que esta recibe parámetros.[/fill]"]
	)
	complete_step()
	
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_code(6, 6, 5)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Convertir a String")
	bubble_add_text(
		["Lo mismo con [b]str()[/b], que convierte cualquier tipo de dato a [b]String[/b]."]
	)
	complete_step()

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_3.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 3")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica3"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 3")
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
			return 1 if current_script == practice3 else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 3")
	bubble_add_task(
		"Crea una función que retorne el numero de palabras de un texto.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice3).source_code.replace(" ", "")
			if source_code.contains("func") && source_code.contains("return"):
				return 1
			return 0
	)
	bubble_add_task(
		"Usa [b]split()[/b] para separar las palabras y usa [b]len()[/b] para contar las palabras.",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice3).source_code.replace('" "', '"*"')
			source_code = source_code.replace(" ", "")
			if source_code.contains('.split("*")') && source_code.contains("len("):
				return 1
			return 0
	)
	bubble_add_task(
		"Imprime el resultado en [b]_ready():[/b].",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			if current_code.contains("print("):
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
			var logger := interface.logger_text.get_parsed_text().c_unescape().split("\n ")
			if EditorInterface.is_playing_scene() && total_errors == 0:
				if !interface.logger_text.get_parsed_text().is_empty():
					var regex := RegEx.new()
					regex.compile(r"\d")
					if regex.search(logger[1]):
						bubble.code = load(practice3).source_code
						return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 3")
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
			["[b]Gracias por repasar la lección.[/b]"]
		)
	complete_step()
