extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	add = "res://addons/godot-course/ui/icons/add.svg",
	instance = "res://addons/godot-course/ui/icons/instance.svg",
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/finalizando/finalizando.tres")

const CURRENT_LESSON := "finalizando"
const NEXT_LESSON := "finalizando"

const SHORTCUT = preload("res://addons/godot-course/lessons/finalizando/videos/shortcut.ogv")

func _build() -> void:
	init()
	intro()
	add_color_rect()
	change_layout()
	add_audio_stream()
	rename()
	add_audio()
	coding()
	save_scene_main()
	add_keyboard_shortcut()
	save_scene_hud()
	outro()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(5)

func intro() -> void:
	scene_open("res://DodgeTheCreeps/principal.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("La escena principal del juego.")
	bubble_add_text(
		["[center]En esta lección pondremos los últimos detalles en el juego.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func add_color_rect() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Fondo")
	bubble_add_text(
		["[fill]El fondo gris predeterminado no es muy atractivo, así que cambiemos su color. Una forma de hacerlo es usar un nodo [b]ColorRect[/b].[/fill]"]
	)
	bubble_add_task(
		"Presiona el botón +",
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("ColorRect")
	bubble_add_text(
		["En la barra de búsqueda escribe ColorRect."]
	)
	bubble_add_task(
		"Escribe ColorRect.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "colorrect":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("ColorRect")
	bubble_add_text(
		["Bien, ahora puedes agregar el nodo a la escena."]
	)
	bubble_add_task(
		"Presiona el botón crear.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_create_dialog_button_create.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("ColorRect")
	bubble_add_text(
		["Coloca el fondo por debajo del nodo Principal para que se dibuje detrás de los otros nodos."]
	)
	bubble_add_task(
		"Mueve El [b]colorrect[/b] por de bajo de [b]Principal[/b].",
		false,
		1,
		func(task : Task) -> int:
			var node := EditorInterface.get_edited_scene_root().get_child(0)
			if node.get_class() == "ColorRect":
				interface.scene_tree.get_root().get_child(0).select(0)
				interface.scene_tree.set_selected(interface.scene_tree.get_root().get_child(0), 0)
				return 1
			return 0
	)
	complete_step()

func change_layout() -> void:
	highlight_inspector_properties(["anchors_preset"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Disposición")
	bubble_add_text(
		["Por ultimo, cambia su preset para que ColoRect ocupe toda la pantalla."]
	)
	bubble_add_task(
		"Cambia el layout preset a [b]Todo el Rect[/b].",
		false,
		1,
		func(task : Task) -> int:
			var node := EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.anchors_preset == Control.PRESET_FULL_RECT else 0
	)
	complete_step()
	
	highlight_inspector_properties(["color"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("ColorRect")
	bubble_add_text(
		["Puedes cambiar el color del fondo como gustes."]
	)
	complete_step()

func add_audio_stream() -> void:
	highlight_scene_nodes_by_name(["Principal"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("AudioStream")
	bubble_add_text(
		["Selecciona el nodo Principal"]
	)
	bubble_add_task_select_node("Principal")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("AudioStream")
	bubble_add_text(
		["El sonido y la música pueden ser la forma más eficaz de añadir atractivo a la experiencia de juego."]
	)
	bubble_add_task(
		"Presiona el botón +",
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AudioStream")
	bubble_add_text(
		["En la barra de búsqueda escribe AudioStream."]
	)
	bubble_add_task(
		"Escribe AudioStreamPlayer.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "audiostreamplayer":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AudioStream")
	bubble_add_text(
		["Bien, ahora puedes agregar el nodo a la escena."]
	)
	bubble_add_task(
		"Presiona el botón crear.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_create_dialog_button_create.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("AudioStream")
	bubble_add_text(
		["Necesitas 2 nodos de este tipo por lo que debes duplicar el nodo una vez."]
	)
	bubble_add_task(
		"Presiona (CTRL + D).",
		false,
		1,
		func(task : Task) -> int:
			var scene_nodes := EditorInterface.get_edited_scene_root().find_children("", "AudioStreamPlayer")
			return 1 if scene_nodes.size() == 2 else 0
	)
	complete_step()

func rename() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Cambia el nombre del primer audio a Música."]
	)
	bubble_add_task(
		"Cambia el nombre a Música",
		false,
		1,
		func(task : Task) -> int:
			var audio_stream := EditorInterface.get_edited_scene_root().get_child(8)
			if audio_stream == null:
				return 0
			return 1 if audio_stream.name == "Música" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora cambia el nombre del segundo audio a SonidoMuerte."]
	)
	bubble_add_task(
		"Cambia el nombre a SonidoMuerte",
		false,
		1,
		func(task : Task) -> int:
			var audio_stream := EditorInterface.get_edited_scene_root().get_child(9)
			if audio_stream == null:
				return 0
			return 1 if audio_stream.name == "SonidoMuerte" else 0
	)
	complete_step()

func add_audio() -> void:
	highlight_scene_nodes_by_name(["Música"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Audio")
	bubble_add_text(["Selecciona el nodo Música para que puedas colocarle el archivo de audio."])
	bubble_add_task_select_node("Música")
	complete_step()
	
	highlight_inspector_properties(["stream"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	highlight_filesystem_paths(["res://DodgeTheCreeps/art/House In a Forest Loop.ogg"])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Audio")
	bubble_add_text(["Arrastra el archivo desde el sistema de archivos hasta la propiedad."])
	bubble_add_task(
		"Coloca el archivo House In a Forest Loop.ogg",
		false,
		1,
		func(task : Task) -> int:
			var audio_stream := EditorInterface.get_edited_scene_root().get_child(8)
			if audio_stream == null:
				return 0
			return 1 if audio_stream.stream != null else 0
	)
	complete_step()
	
	highlight_scene_nodes_by_name(["SonidoMuerte"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Audio")
	bubble_add_text(["Solo falta el segundo nodo de audio por colocarle su archivo de audio."])
	bubble_add_task_select_node("SonidoMuerte")
	complete_step()
	
	highlight_inspector_properties(["stream"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	highlight_filesystem_paths(["res://DodgeTheCreeps/art/findeljuego.wav"])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Audio")
	bubble_add_text(["Arrastra el archivo desde el sistema de archivos hasta la propiedad."])
	bubble_add_task(
		"Coloca el archivo findeljuego.wav",
		false,
		1,
		func(task : Task) -> int:
			var audio_stream := EditorInterface.get_edited_scene_root().get_child(9)
			if audio_stream == null:
				return 0
			return 1 if audio_stream.stream != null else 0
	)
	complete_step()

func coding() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	context_set_script()
	var code := 'func nuevo_juego():
	puntuacion = 0
	$Jugador.start($"PosiciónInicial".position)
	$CronometroInicio.start()
	$HUD.actualizar_puntuacion(puntuacion)
	$HUD.mostrar_mensaje("¡Preparate!")
	get_tree().call_group("enemigos", "queue_free")
	$Música.play()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text([
		"Para reproducir la música, agrega $Música.play() en la función nuevo_juego()."
	])
	bubble_add_code(["func nuevo_juego():
	...
	$Música.play()"])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			code = code.replace(" ", "")
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	context_set_script()
	code = 'func fin_del_juego():
	$"CronometroPuntuación".stop()
	$CronometroEnemigo.stop()
	$HUD.mostrar_fin_del_juego()
	$Música.stop()
	$SonidoMuerte.play()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text([
		"Finalmente, agrega $Musica.stop() y $SonidoMuerte.play() en la función fin_del_juego()."
	])
	bubble_add_code(["func fin_del_juego():
	...
	$Musica.stop()
	$SonidoMuerte.play()"
	])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text
			return 1 if current_code.contains(code) else 0
	)
	complete_step()

func add_keyboard_shortcut() -> void:
	scene_open("res://DodgeTheCreeps/hud.tscn")
	highlight_scene_nodes_by_name(["BotónInicio"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Atajo de teclado")
	bubble_add_text([
		"Dado que el juego se juega con controles de teclado, sería conveniente si también pudiéramos iniciar el juego presionando una tecla del teclado.",
		"Selecciona el botón que inicia el juego."
	])
	bubble_add_task_select_node("BotónInicio")
	complete_step()
	
	highlight_inspector_properties(["shortcut"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[21])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Atajo de teclado")
	bubble_add_text(
		["Agrega un nuevo atajo de teclado haciendo click dentro del cuadro, abre la matriz de eventos y agrega un nuevo elemento."]
	)
	bubble_add_task(
		"Agrega un [b]Shortcut[/b] y añade un elemento del tipo [b]InputEventAction[/b]",
		false,
		1,
		func(task : Task) -> int:
			var button := EditorInterface.get_edited_scene_root().get_child(2)
			if button.shortcut != null:
				if !button.shortcut.events.is_empty():
					if button.shortcut.events[0] != null:
						if button.shortcut.events[0].is_class("InputEventAction"):
							return 1
			return 0
	)
	bubble_add_video(SHORTCUT)
	complete_step()
	
	highlight_inspector_properties(["shortcut"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[22])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Atajo de teclado")
	bubble_add_text(
		["Solo falta que agregues la acción que quieres que ejecute el evento."]
	)
	bubble_add_task(
		"Escribe ui_accept en Action",
		false,
		1,
		func(task : Task) -> int:
			var button := EditorInterface.get_edited_scene_root().get_child(2)
			return 1 if button.shortcut.events[0].action == "ui_accept" else 0
	)
	bubble_add_video(SHORTCUT)
	complete_step()

func save_scene_main() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[23])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guardar escena")
	bubble_add_text([
		"No olvides guardar los cambios."
	])
	bubble_add_task(
		"Guarda la escena.",
		false,
		1,
		func(task : Task) -> int:
			var scene_name := interface.main_screen_tabs.get_tab_title(0)
			return 1 if !scene_name.contains("(*)") else 0
	)
	complete_step()

func save_scene_hud() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[24])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guardar escena")
	bubble_add_text([
		"¡Felicidades haz completado tu primer videojuego!",
		"Lo único que falta es guardar la escena."
	])
	bubble_add_task(
		"Guarda la escena.",
		false,
		1,
		func(task : Task) -> int:
			var scene_name := interface.main_screen_tabs.get_tab_title(1)
			return 1 if !scene_name.contains("(*)") else 0
	)
	complete_step()

func outro() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[25])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Finalizando")
	bubble_add_text([
		"[fill]Para hacer retrospectiva, haz creado un personaje controlable, enemigos que aparecen aleatoriamente en el tablero de juego, contar la puntuación, implementar un fin del juego y reiniciarlo, una interfaz de usuario, sonidos y más.[/fill]"
	])
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[26])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Finalizando")
	bubble_add_text([
		"El curso ya ha terminado pero aún queda mucho por aprender, por el momento puedes tomarte el tiempo de probar lo que lograste.",
		"Te deseo buena suerte con tus estudios y espero que logres cumplir tus objetivos que estés bien hasta luego."
	])
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
