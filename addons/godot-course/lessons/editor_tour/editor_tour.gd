extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/editor_tour/editor_tour.tres")

const PLAY_SCENE := preload("res://addons/godot-course/lessons/editor_tour/videos/play_scene.ogv")
const STOP_SCENE = preload("res://addons/godot-course/lessons/editor_tour/videos/stop_scene.ogv")
const PAUSE_SCENE = preload("res://addons/godot-course/lessons/editor_tour/videos/pause_scene.ogv")
const _2D := preload("res://addons/godot-course/lessons/editor_tour/videos/2D.ogv")
const _3D := preload("res://addons/godot-course/lessons/editor_tour/videos/3D.ogv")
const FIX_BUGS := preload("res://addons/godot-course/lessons/editor_tour/videos/fix_bugs.ogv")
const SCENE_TREE := preload("res://addons/godot-course/lessons/editor_tour/imagenes/scene_tree.png")

const CURRENT_LESSON := "editor_tour"
const NEXT_LESSON := "nodos"

func _build() -> void:
	init()
	steps_intro()
	run_bar_intro()
	context_switcher_intro()
	menu_bar_intro()
	scene_tree_intro()
	inspector_editor_intro()
	filesystem_dock_intro()
	ouput_intro()
	debugger_intro()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(2)

func steps_intro() -> void:
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Editor recorrido")
	bubble_add_text(
		["[center]En esta lección haremos un breve recorrido por el editor.[/center]", 
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func run_bar_intro() -> void:
	highlight_controls([interface.run_bar], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Barra de ejecución")
	bubble_add_text(
		["[fill]En este panel se encuentran varios botones.[/fill]",
		"[fill]Cada uno tiene una función especial.[/fill]",
		"[fill]Para no hacerte el cuento largo solo te explicaré lo necesario para darte contexto.[/fill]"]
	)
	complete_step()
	
	highlight_controls([interface.run_bar_play_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_set_title("Ejecutar escena principal")
	bubble_add_text(
		["Al presionar este botón ejecutara la escena principal de tu juego."]
	)
	complete_step()
	
	highlight_controls([interface.run_bar_play_current_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_set_title("Ejecutar escena actual")
	bubble_add_text(
		["[fill]Al presionar este botón ejecutará la escena que tengas actualmente abierta.[/fill]"]
	)
	bubble_add_video(PLAY_SCENE)
	complete_step()
	
	highlight_controls([interface.run_bar_pause_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_set_title("Pausar juego")
	bubble_add_text(
		["Al presionar este botón pausara el juego."]
	)
	bubble_add_video(PAUSE_SCENE)
	complete_step()
	
	highlight_controls([interface.run_bar_stop_button], true)
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_set_title("Detener juego")
	bubble_add_text(
		["Al presionar este botón detendrá el juego."]
	)
	bubble_add_video(STOP_SCENE)
	complete_step()

func context_switcher_intro() -> void:
	highlight_controls([interface.context_switcher], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Modos")
	bubble_add_text(
		["Godot contiene varios apartados.",
		"2D, 3D, Script y AssetLib."]
	)
	complete_step()
	
	highlight_controls([interface.context_switcher_2d_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_set_title("2D")
	bubble_add_text(
		["El editor 2D sirve para la creación de juegos en 2 dimensiones."]
	)
	bubble_add_video(_2D)
	complete_step()
	
	highlight_controls([interface.context_switcher_3d_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_set_title("3D")
	bubble_add_text(
		["Por el contrario al 2D.",
		"El editor 3D sirve para la creación de juegos en 3 dimensiones."]
	)
	bubble_add_video(_3D)
	complete_step()
	
	highlight_controls([interface.context_switcher_script_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_set_title("Script")
	bubble_add_text(
		["El editor de scripts te ayudará a poder escribir código de una manera más sencilla y cómoda."]
	)
	complete_step()
	
	highlight_controls([interface.context_switcher_asset_lib_button], true)
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_set_title("Libreria de Assets")
	bubble_add_text(
		["[fill]Esto no es un editor si no una librería donde podrás conseguir artículos completamente gratis.[/fill]",
		"Desde demos, plugins, imagenes, modelos 3D, etc."]
	)
	complete_step()

func menu_bar_intro() -> void:
	highlight_controls([interface.menu_bar], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Configuraciones")
	bubble_add_text(
		["Esta parte contiene opciones muy extensas.",
		"Como configuraciones del proyecto, del editor, herramientas, etc.",
		"Más adelante veremos algunas de estas opciones."]
	)
	complete_step()

func canvas_item_editor_intro() -> void:
	highlight_controls([interface.canvas_item_editor], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Lienzo")
	bubble_add_text(
		["Esto que vez es el lienzo donde podrás visualizar las diferentes escenas de tu juego."]
	)
	complete_step()

func scene_tree_intro() -> void:
	highlight_controls([interface.scene_dock], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Panel de escena")
	bubble_add_text(
		["En este panel podrás visualizar los nodos con los que está conformada tu escena."]
	)
	bubble_add_texture(SCENE_TREE)
	complete_step()

func inspector_editor_intro() -> void:
	highlight_controls([interface.inspector_editor], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Inspector")
	bubble_add_text(
		["En este panel podrás visualizar las propiedades del nodo que tengas seleccionado en tu escena."]
	)
	complete_step()

func filesystem_dock_intro() -> void:
	highlight_controls([interface.filesystem_dock], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Sistema de archivos")
	bubble_add_text(
		["En este panel se encuentra el sistema de archivos.",
		"[fill]Donde podrás acceder a todos los recursos de tu juego.[/fill]"]
	)
	complete_step()

func ouput_intro() -> void:
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = true
	)
	highlight_controls([interface.logger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Salida")
	bubble_add_text(
		["[fill]La salida te mostrará la información arrojada por tu juego.[/fill]",
		"[fill]Te será de ayuda a saber si tu juego está funcionando correctamente.[/fill]"]
	)
	complete_step()

func debugger_intro() -> void:
	queue_command(func debugger_open():
		interface.bottom_button_debugger.button_pressed = true
	)
	highlight_controls([interface.debugger], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	bubble_set_title("Debugger")
	bubble_add_text(
		["[fill]Este menú es parecido al anterior, pero es mucho más avanzado.[/fill]",
		"[fill]Te será de ayuda para encontrar fallos en tu juego, pero de una manera más precisa.[/fill]"]
	)
	bubble_add_video(FIX_BUGS)
	complete_step()
	queue_command(func debugger_close():
		interface.bottom_button_debugger.button_pressed = false
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
