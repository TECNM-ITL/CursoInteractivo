extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/operadores/operadores.tres")

const CURRENT_LESSON := "operadores"
const NEXT_LESSON := "condicionales"
const PRACTICE := "practica_4"

var script_operadores := "res://GDScript/ejemplos/operadores_ejemplos.gd"
var practice4 := "res://GDScript/practicas/practica_4.gd"

func _build() -> void:
	init()
	intro()
	open_script()
	variables()
	add()
	sub()
	mult()
	div()
	rest_div()
	run_code()
	output()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(4)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/operadores.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Operadores aritméticos")
	bubble_add_text(
		["[center]En esta lección veremos los operadores aritméticos.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Operadores"])
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
			return 1 if current_script == script_operadores else 0,
	)
	complete_step()

func variables() -> void:
	highlight_code(3, 5, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Variables")
	bubble_add_text(
		["Aquí ya estan unas variables declaradas.",
		"Las usaremos para cada una de las operaciones."]
	)
	complete_step()

func add() -> void:
	highlight_code(8, 8, 7)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Suma")
	bubble_add_text(
		["[fill]El operador + permite hacer sumas.[/fill]",
		"[fill]Con este operador puedes sumar todas las variables y constantes que quieras.[/fill]"]
	)
	complete_step()
	
	highlight_code(9, 9, 8)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Concatenar")
	bubble_add_text(
		["También sirve para concatenar.",
		"Lo que permite la unión de strings."]
	)
	complete_step()

func sub() -> void:
	highlight_code(10, 10, 9)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Resta")
	bubble_add_text(
		["El operador - permite hacer restas."]
	)
	complete_step()

func mult() -> void:
	highlight_code(12, 12, 11)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Multiplicación")
	bubble_add_text(
		["El operador * permite hacer multiplicaciones."]
	)
	complete_step()

func div() -> void:
	highlight_code(14, 14, 13)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("División")
	bubble_add_text(
		["El operador / permite hacer divisiones."]
	)
	complete_step()

func rest_div() -> void:
	highlight_code(16, 16, 15)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Resto de división")
	bubble_add_text(
		["[fill]El operador % permite obtener el resto de una división entre dos números, esto puede ser realmente útil si por ejemplo quieres comprobar si un número es par o impar. Para hacer esta operación debes poner los números en enteros.[/fill]"]
	)
	complete_step()

func run_code() -> void:
	highlight_controls([interface.run_bar_play_current_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Prueba el código")
	bubble_add_text(
		["Ahora ejecuta el código."]
	)
	bubble_add_task_press_button(interface.run_bar_play_current_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.play) + " para ejecutar la escena")
	complete_step()

func output() -> void:
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Hola mundo")
	bubble_add_text(
		["Ahora puedes observar el mensaje en la salida."]
	)
	complete_step()
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = false
	)

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_4.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 4")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica4"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 4")
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
			return 1 if current_script == practice4 else 0
	)
	complete_step()
	
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_set_title("Práctica 4")
	bubble_add_task(
		"Realiza las operaciones de suma, resta, multiplicación y división con dos números.",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice4).source_code.replace(" ", "")
			if source_code.contains("varnumero1=") && source_code.contains("varnumero2=") && source_code.contains("suma=") && source_code.contains("resta=") && source_code.contains("multiplicacion=") && source_code.contains("division="):
				if source_code.count("numero1") == 5 && source_code.count("numero2") == 5 && source_code.contains("+") && source_code.contains("-") && source_code.contains("*") && source_code.contains("/"):
					return 1
			return 0
	)
	bubble_add_task(
		"Imprime los resultados de cada operación en [b]_ready():[/b].",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice4).source_code.replace(" ", "")
			if source_code.contains("print(suma)") && source_code.contains("print(resta)") && source_code.contains("print(multiplicacion)") && source_code.count("print(division)"):
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
						bubble.code = load(practice4).source_code
						return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 4")
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
