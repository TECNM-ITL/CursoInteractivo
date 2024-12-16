extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/listas/listas.tres")

const CURRENT_LESSON := "listas"
const NEXT_LESSON := "errores"
const PRACTICE := "practica_7"

var script_listas := "res://GDScript/ejemplos/listas_ejemplos.gd"
var practice7 := "res://GDScript/practicas/practica_7.gd"

const ARRAY := preload("res://addons/godot-course/lessons/listas/videos/array.ogv")

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	array_example()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(4)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/listas.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Listas")
	bubble_add_text(
		["[center]En esta lección aprenderás sobre las listas.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es una lista?")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_add_text(
		["Una lista o array es una estructura de datos que permite almacenar múltiples elementos del mismo tipo en una sola variable."]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Listas"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
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
			return 1 if current_script == script_listas else 0,
	)
	complete_step()

func array_example() -> void:
	highlight_code(3, 3, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Array")
	bubble_add_text([
		"Esta es la manera de declarar un [b]array[/b].",
		"En este se almacenan algunas de las marcas de coches."
	])
	complete_step()
	
	highlight_code(3, 3, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Array")
	bubble_add_text([
		"[fill]La estructura que tiene una lista no es complicada solo debes abrir y cerrar corchetes y colocar los valores separándolos por comas.[/fill]"
	])
	complete_step()
	
	highlight_code(3, 3, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Array")
	bubble_add_text([
		"Cada elemento tiene un numero que representa su posición empezando desde 0."
	])
	bubble_add_video(ARRAY)
	complete_step()
	
	highlight_code(6, 7, 6)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar elementos")
	bubble_add_text([
		"Si queremos agregar más elementos a la lista puedes usar el método [b]append()[/b]."
	])
	complete_step()
	
	highlight_code(9, 11, 9)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Recorrer elementos")
	bubble_add_text([
		"Puedes recorrer cada uno de los elementos con un bucle como se muestra en este ejemplo."
	])
	complete_step()
	
	highlight_code(13, 14, 13)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Obtener elemento")
	bubble_add_text([
		"Para obtener un elemento de una lista debes indicar la posición que este ocupa en la lista."
	])
	complete_step()
	
	highlight_code(16, 17, 15)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Obtener elemento")
	bubble_add_text([
		"Por ultimo tenemos este bucle donde se usa el método [b]size()[/b] que retorna el tamaño de la lista.",
		"También se puede usar el método [b]len()[/b] que se mostró en lecciones anteriores."
	])
	complete_step()
	
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_code(16, 18, 15)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Obtener elemento")
	bubble_add_text([
		"Después imprime el valor y su posición que ocupa en la lista."
	])
	complete_step()

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_7.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 7")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica7"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 7")
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
			return 1 if current_script == practice7 else 0
	)
	complete_step()
	
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 7")
	bubble_add_task(
		"Crea un array (lista) que contenga al menos cinco números.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice7).source_code.replace(" ", "")
			if source_code.contains("[") && source_code.count(",") == 4:
				return 1
			return 0
	)
	bubble_add_task(
		"Escribe una función que devuelva la suma de todos los elementos usando un [b]for[/b].",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice7).source_code.replace(" ", "")
			if source_code.contains('for') && source_code.contains("+=") && source_code.contains("return"):
				return 1
			return 0
	)
	bubble_add_task(
		"Imprime el resultado en [b]_ready():[/b].",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice7).source_code.replace(" ", "")
			if source_code.contains("print("):
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
						bubble.code = load(practice7).source_code
						return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 7")
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
			["[b]¡Felicidades, has completado la lección![/b]"]
		)
	else:
		bubble_add_text(
			["[b]Gracias por repasar la lección.[/b]"]
		)
	complete_step()
