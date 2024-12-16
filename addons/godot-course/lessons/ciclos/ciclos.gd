extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/ciclos/ciclos.tres")

const CURRENT_LESSON := "ciclos"
const NEXT_LESSON := "listas"
const PRACTICE := "practica_6"

const CICLO := preload("res://addons/godot-course/lessons/ciclos/videos/ciclo.ogv")

var script_ciclos := "res://GDScript/ejemplos/ciclos_ejemplos.gd"
var practice6 := "res://GDScript/practicas/practica_6.gd"

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	loop_for()
	loop_while()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(4)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/ciclos.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Ciclos")
	bubble_add_text(
		["[center]En esta lección veremos los ciclos.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Ciclos")
	bubble_add_text(
		["[fill]Los ciclos son estructuras que permiten repetir una serie de instrucciones varias veces.[/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Ciclos")
	bubble_add_text(
		["[fill]Imagina que tienes que hacer una tarea repetitiva, como sumar los números del 1 al 5.[/fill]",
		"[fill]En lugar de escribir la suma para cada número manualmente, puedes usar un bucle para que el programa lo haga por ti automáticamente.[/fill]"]
	)
	bubble_add_video(CICLO)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_name(["Ciclos"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
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
			return 1 if current_script == script_ciclos else 0,
	)
	complete_step()

func loop_for() -> void:
	highlight_code(9, 12, 10)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Ciclo for")
	bubble_add_text(["El ciclo [b]for[/b] permite repetir un conjunto de instrucciones un numero determinado de veces."])
	complete_step()
	
	highlight_code(9, 12, 10)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_set_title("Ciclo for")
	bubble_add_text([
		"Este ejemplo realiza un conteo en un rango de 1 a 5."])
	complete_step()

func loop_while() -> void:
	highlight_code(14, 17, 14)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_set_title("Ciclo while")
	bubble_add_text([
		"El ciclo [b]while[/b] permite repetir un conjunto de instrucciones, pero se repite mientras se cumpla una condición."])
	complete_step()
	
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_code(14, 17, 14)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Ciclo while")
	bubble_add_text([
		"Este ejemplo realiza un des conteo del ejemplo anterior hasta llegar a 1."])
	complete_step()

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_6.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 6")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica6"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 6")
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
			return 1 if current_script == practice6 else 0
	)
	complete_step()
	
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 6")
	bubble_add_task(
		"Realiza un ciclo [b]for[/b] que cuente del 1 al 10 usando [b]range()[/b].",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice6).source_code.replace(" ", "")
			if source_code.contains("for") && source_code.contains("+=1"):
				if source_code.contains("inrange(1,11):"):
					return 1
			return 0
	)
	bubble_add_task(
		"Realiza un ciclo [b]while[/b] que reste del 10 al 1.",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice6).source_code.replace(" ", "")
			if source_code.contains("while") && source_code.contains("-=1"):
				if source_code.contains(">=1") || source_code.contains(">1") || source_code.contains("!=1"):
					return 1
			return 0
	)
	bubble_add_task(
		"Imprime el conteo en [b]_ready():[/b].",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice6).source_code.replace(" ", "")
			if source_code.count("print(") == 2:
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
					regex.compile(r"\b(?:10|[1-9])\b")
					if regex.search(logger[1]):
						bubble.code = load(practice6).source_code
						return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 6")
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
