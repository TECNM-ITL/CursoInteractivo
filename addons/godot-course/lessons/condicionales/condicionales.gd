extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/condicionales/condicionales.tres")

const CURRENT_LESSON := "condicionales"
const PRACTICE := "practica_5"

var script_condicionales := "res://GDScript/ejemplos/condicionales_ejemplos.gd"
var practice5 := "res://GDScript/practicas/practica_5.gd"

const CONDICIONALES := preload("res://addons/godot-course/lessons/condicionales/videos/condicionales.ogv")

func _build() -> void:
	init()
	intro()
	what_is()
	open_script()
	aux_variables()
	practice()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(4)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/condicionales.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Condicionales")
	bubble_add_text(
		["[center]En esta lección veremos las condicionales.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Para qué sirven?")
	bubble_add_text(
		["Las condiciones sirven para poder tomar decisiones.",
		"Comprobando si algo es verdadero o falso."]
	)
	bubble_add_video(CONDICIONALES)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["Condicionales"])
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
			return 1 if current_script == script_condicionales else 0,
	)
	complete_step()

func aux_variables() -> void:
	highlight_code(3, 4, 2)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Variables auxiliares")
	bubble_add_text(
		["Estas variables serán de ayuda para los ejemplos de las condicionales."]
	)
	complete_step()
	
	highlight_code(6, 9, 5)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Es igual que?")
	bubble_add_text(
		["En este primer ejemplo se comprueba si una variable es igual a un valor específico.",
		"Para comprobar esto se debe usar el operador [b]==[/b]"]
	)
	complete_step()
	
	highlight_code(11, 14, 10)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿No es igual que?")
	bubble_add_text(
		["[fill]En este segundo ejemplo es lo contrario del primero, se comprueba si no es igual al valor especificado.[/fill]",
		"Para comprobar esto se debe usar el operador [b]!=[/b]"]
	)
	complete_step()
	
	highlight_code(16, 19, 15)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Es mayor que?")
	bubble_add_text(
		["[fill]El tercer ejemplo se comprueba si el valor es mayor que 50.[/fill]",
		"Para comprobar esto se debe usar el operador [b]>[/b]"]
	)
	complete_step()
	
	highlight_code(21, 24, 20)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Es menor que?")
	bubble_add_text(
		["[fill]El cuarto ejemplo lo contrario del anterior pero si valor es menor que 100.[/fill]",
		"Para comprobar esto se debe usar el operador [b]<[/b]"]
	)
	complete_step()
	
	highlight_code(26, 29, 25)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Es mayor igual que?")
	bubble_add_text(
		["[fill]En este quinto ejemplo podemos ver que se puede combinar [b]=[/b] y [b]>[/b] lo que significa si algo es mayor o igual que.[/fill]"]
	)
	complete_step()
	
	highlight_code(31, 34, 30)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Es menor igual que?")
	bubble_add_text(
		["[fill]También se puede combinar [b]=[/b] y [b]<[/b] lo que significa si algo es menor o igual que.[/fill]"]
	)
	complete_step()
	
	highlight_code(36, 44, 35)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿y? ¿o?")
	bubble_add_text(
		["[fill]El séptimo y octavo ejemplo nos muestra que podemos agregar más condicionales.[/fill]",
		"[fill]El operador [b]&&[/b] sirve para comprobar si todas las condiciones se cumplen.[/fill]",
		"[fill]Por otro lado [b]||[/b] sirve para comprobar si una de las condiciones se cumplen.[/fill]"]
	)
	complete_step()
	
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_code(46, 52, 45)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("De lo contrario")
	bubble_add_text(
		["[fill]Ya por ultimo tenemos [b]elif[/b] y [b]else[/b].[/fill]",
		"[fill]Que sirven para dar condiciones alternativas a la condicional principal [b]if[/b].[/fill]",
		"[fill]Nota: [b]else[/b] no necesita de una condición ya que tomara como referencia a [b]if[/b] y [b]elif[/b].[/fill]"]
	)
	complete_step()

func practice() -> void:
	scene_open("res://GDScript/practicas/practica_5.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 5")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica5"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 5")
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
			return 1 if current_script == practice5 else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 5")
	bubble_add_task(
		"Comprueba si un número es par o impar.",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			var source_code : String = load(practice5).source_code.replace(" ", "")
			if source_code.contains("varnumero=") && source_code.contains("ifnumero%2"):
				if source_code.contains("elif") || source_code.contains("else:"):
					if source_code.contains("==0") || source_code.contains("==1"):
						return 1
			return 0
	)
	bubble_add_task(
		"Imprime si es par o es impar en [b]_ready():[/b].",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(practice5).source_code.replace(" ", "")
			source_code = source_code.to_lower()
			if source_code.contains('print("espar")') && source_code.contains('print("esimpar")'):
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
			var logger := interface.logger_text.get_parsed_text()
			if EditorInterface.is_playing_scene() && total_errors == 0:
				if !interface.logger_text.get_parsed_text().is_empty():
					if logger.contains("par") || logger.contains("impar"):
						bubble.code = load(practice5).source_code
						return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 5")
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
