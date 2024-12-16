extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg",
	play = "res://addons/godot-course/ui/icons/play_scene.svg",
	close = "res://addons/godot-course/ui/icons/icon_close.png"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const ONE_CERO := preload("res://addons/godot-course/lessons/hola_gdscript/videos/01.ogv")
const HELLO_WORLD := preload("res://addons/godot-course/lessons/hola_gdscript/videos/hello_world.ogv")
const SCRIPT := preload("res://addons/godot-course/lessons/hola_gdscript/videos/script.ogv")

const DIALOGUES := preload("res://addons/godot-course/lessons/hola_gdscript/hola_gdscript.tres")

const CURRENT_LESSON := "hola_gdscript"
const NEXT_LESSON := "variables"
const PRACTICE := "practica_1"

var script_hello := "res://GDScript/ejemplos/hola_mundo.gd"
var practice1 := "res://GDScript/practicas/practica_1.gd"

func _build() -> void:
	init()
	intro()
	programming_intro()
	computer_comunication()
	gdscript_intro()
	open_script()
	hello_world()
	run_code()
	output()
	practice()
	close_scene()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(5)

func intro() -> void:
	scene_open("res://GDScript/ejemplos/hola_mundo.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("GDScript")
	bubble_add_text(
		["[center]En las siguientes lecciones aprenderás a programar en GDScript.[/center]",
		"[center]¡Vamos a empezar con lo básico![/center]"]
	)
	complete_step()

func programming_intro() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es la programación?")
	bubble_add_text(
		["[fill]La programación es darle instrucciones a una computadora para que haga una serie de tareas.[/fill]",
		"[fill]Programar se puede comparar con recibir una lista de compras de tu madre: ella te indica exactamente qué productos comprar y en qué orden hacerlo, asegurándose de que sigas las instrucciones para completar la tarea correctamente.[/fill]"]
	)
	bubble_add_video(SCRIPT)
	complete_step()

func computer_comunication() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Cómo comunicarse con la computadora?")
	bubble_add_text(
		["[fill]Para comunicarnos con la computadora necesitaríamos saber su lenguaje.[/fill]",
		"[fill]Pero su lenguaje es demasiado complicado para un humano, ya que solo usa 0 y 1.[/fill]",
		"[fill]Afortunadamente existen los lenguajes de programación para comunicarnos fácilmente.[/fill]"]
	)
	bubble_add_video(ONE_CERO)
	complete_step()

func gdscript_intro() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es GDScript?")
	bubble_add_text(
		["[fill]GDScript es un lenguaje de programación de alto nivel, orientado a objetos, imperativa y escritura gradual.[/fill]",
		"¡Echemos un vistazo a su código!"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es GDScript?")
	bubble_add_text(
		["[fill]Por otro lado GDScript es un lenguaje de escritura dinámica lo cual lo hace muy fácil de aprender.[/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué es GDScript?")
	bubble_add_text(
		["[fill]GDScript tiene una estructura y sintaxis similar a lenguajes como Python.[/fill]",
		"[fill]Por lo tanto aprender GDScript te ayudara a entender otros lenguajes.[/fill]"]
	)
	complete_step()

func open_script() -> void:
	highlight_scene_nodes_by_path(["HolaMundo"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Abrir script")
	bubble_add_text([
		"[fill]Antes de comenzar a programar primero necesitaremos un script o guion con el que escribiremos las instrucciones que queramos dar.[/fill]"
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

func hello_world() -> void:
	highlight_controls([interface.script_editor], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Editor de scripts")
	bubble_add_text(
		["[fill]Esto que vez es el editor de scripts donde podrás escribir las instrucciones que le darás a la computadora.[/fill]"]
	)
	complete_step()
	
	highlight_code(1, 4, 0, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Código")
	bubble_add_text(
		["[fill]Aquí ya hay un ejemplo de código.[/fill]",
		"[fill]Lo único que hará este código es imprimir un mensaje de 'Hola mundo'.[/fill]"]
	)
	complete_step()
	
	highlight_code(4, 4, 3, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Hola mundo")
	bubble_add_text(
		["[fill]Este pedazo de código es donde hará la impresión del mensaje en la salida.[/fill]"]
	)
	bubble_add_video(HELLO_WORLD)
	complete_step()
	
	highlight_code(3, 3, 2, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Hola mundo")
	bubble_add_text(
		['[fill]El código mostrado a anteriormente está dentro de la función [b]_ready()[/b], que es un método especial en Godot. Esta función se ejecuta automáticamente cuando la escena ha terminado de cargarse y está lista para interactuar. Dado que _ready() es un método principal, todo el código que coloques dentro de esta función se ejecutará al inicio del programa, justo después de que se haya inicializado completamente la escena.[/fill]']
	)
	complete_step()
	
	highlight_code(3, 3, 2, true, true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Hola mundo")
	bubble_add_text(
		["[fill]Más adelante se explicara con más detalle que es una función y sus usos.[/fill]"]
	)
	complete_step()

func run_code() -> void:
	highlight_controls([interface.run_bar_play_current_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Prueba el código")
	bubble_add_text(
		["[fill]Ahora ejecuta el código para que puedas observar el mensaje 'Hola mundo'.[/fill]"]
	)
	bubble_add_task_press_button(interface.run_bar_play_current_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.play) + " para ejecutar la escena")
	complete_step()

func output() -> void:
	tabs_set_to_index(interface.main_screen_tabs, 0)
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
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
	scene_open("res://GDScript/practicas/practica_1.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 1")
	bubble_add_text(
		["¡Muy bien es hora de practicar!"]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Practica1"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Práctica 1")
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
			return 1 if current_script == practice1 else 0,
	)
	complete_step()
	
	var user_name : String = Manager.data["nombre"].to_lower()
	var code : String = 'print("' + user_name + '")'
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	highlight_controls([interface.script_editor, interface.run_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 1")
	bubble_add_text(
		["Imprime tu nombre y ejecuta el script."]
	)
	bubble_add_task(
		"Escribe [b]print(tu nombre)[/b]",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var source_code : String = load(practice1).source_code.replace(" ", "")
			source_code = source_code.to_lower()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			if total_errors != 0:
				for node in script_editors[index].get_child(0).get_child(0).get_child(1).get_child(1).get_children():
					if !bubble.errors.has(node.text): bubble.errors.append(node.text)
			if source_code.contains(code):
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
				bubble.code = load(practice1).source_code
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	highlight_controls([interface.logger], true)
	bubble_move_and_anchor(interface.script_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Práctica 1")
	bubble_add_text(
		["¡Bien hecho!."]
	)
	complete_step()
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = false
	)

func close_scene() -> void:
	highlight_controls([interface.main_screen_tabs], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.TOP_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Cerrar escena")
	bubble_add_text(
		["Como puedes ver hay varias pestañas que representan las escenas abiertas en el editor y puedes cerrar cada una de ellas."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.close) + " en todas las pestañas de las escenas.",
		false,
		1,
		func task_open_completed_project_scene(task: Task) -> int:
			var scenes := EditorInterface.get_open_scenes()
			return 1 if scenes.is_empty() else 0
	)
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
			["[b]¡Felicidades, has completado la lección![/b]"]
		)
	else:
		bubble_add_text(
			["[b]Gracias por repasar la lección.[/b]"]
		)
	complete_step()
