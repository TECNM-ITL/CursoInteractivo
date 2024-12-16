extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/interfaz_usuario/interfaz_usuario.tres")

const CURRENT_LESSON := "interfaz_usuario"
const NEXT_LESSON := "finalizando"

func _build() -> void:
	init()
	intro()
	add_canvas_layer()
	what_is_canvas_layer()
	rename_canvas_layer()
	add_label()
	what_is_label()
	rename_label()
	add_button()
	what_is_button()
	rename_button()
	add_timer()
	rename_timer()
	select_score_label()
	change_font()
	change_layout()
	select_message()
	select_button()
	change_time()
	create_script()
	connect_signals()
	coding()
	save_scene()
	instantiate_scene()
	add_more_code()
	outro()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(5)

func intro() -> void:
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Interfaz de usuario.")
	bubble_add_text(
		["[center]En esta lección empezaremos a armar la interfaz de usuario.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func add_canvas_layer() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("CanvasLayer")
	bubble_add_text(
		["Agrega un nodo que servirá como nodo raíz."]
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
	bubble_set_title("CanvasLayer")
	bubble_add_text(
		["En la barra de búsqueda escribe CanvasLayer."]
	)
	bubble_add_task(
		"Escribe CanvasLayer.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "canvaslayer":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("CanvasLayer")
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

func what_is_canvas_layer() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("CanvasLayer")
	bubble_add_text(
		["[fill][b]CanvasLayer[/b] es un nodo que agrega una capa de renderizado 2D independiente para todos sus hijos y nietos. Los hijos de Viewport se dibujarán de forma predeterminada en la capa 0, mientras que un [b]CanvasLayer[/b] se dibujará en cualquier capa numérica. Las capas con un número mayor se dibujarán sobre aquellas con un número menor. Los [b]CanvasLayers[/b] también tienen su propia transformación y no dependen de la transformación de otras capas. Esto permite que la interfaz de usuario se fije en el espacio de la pantalla mientras cambia nuestra vista del mundo del juego.[/fill]"]
	)
	complete_step()

func rename_canvas_layer() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a HUD",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root()
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "HUD" else 0
	)
	complete_step()

func add_label() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Label")
	bubble_add_text(
		["Agrega un nodo hijo a la escena."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Label")
	bubble_add_text(
		["En la barra de búsqueda escribe Label."]
	)
	bubble_add_task(
		"Escribe Label.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "label":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Label")
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Label")
	bubble_add_text(
		["Ya que tienes el nodo Label duplicalo."]
	)
	bubble_add_task(
		"Presiona (CTRL + D).",
		false,
		1,
		func(task : Task) -> int:
			var scene_nodes := EditorInterface.get_edited_scene_root().find_children("", "Label")
			return 1 if scene_nodes.size() == 2 else 0
	)
	complete_step()

func what_is_label() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Label")
	bubble_add_text(
		["[fill][b]Label[/b] es un nodo para mostrar texto sin formato. Te permite controlar la alineación horizontal y vertical y puede ajustar el texto dentro del rectángulo delimitador del nodo. No admite negrita, cursiva u otro formato de texto enriquecido.[/fill]"]
	)
	complete_step()

func rename_label() -> void:
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a PuntuaciónEtiqueta",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.name == "PuntuaciónEtiqueta" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Lo mismo con el segundo Label para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a Mensaje",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.name == "Mensaje" else 0
	)
	complete_step()

func add_button() -> void:
	highlight_scene_nodes_by_name(["HUD"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Label")
	bubble_add_text(
		["Selecciona el nodo HUD"]
	)
	bubble_add_task_select_node("HUD")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Button")
	bubble_add_text(
		["Agrega un nodo hijo a la escena."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Button")
	bubble_add_text(
		["En la barra de busqueda escribe Button."]
	)
	bubble_add_task(
		"Escribe Button.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "button":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Button")
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

func rename_button() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Button")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a BotónInicio",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.name == "BotónInicio" else 0
	)
	complete_step()

func what_is_button() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Button")
	bubble_add_text(
		["[b]Button[/b] es un nodo que permite realizar acciones al ser presionado."]
	)
	complete_step()

func add_timer() -> void:
	highlight_scene_nodes_by_name(["HUD"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Label")
	bubble_add_text(
		["Selecciona el nodo HUD"]
	)
	bubble_add_task_select_node("HUD")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Agrega un timer."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[21])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Timer")
	bubble_add_text(
		["En la barra de búsqueda escribe Timer."]
	)
	bubble_add_task(
		"Escribe Timer.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "timer":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[22])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Timer")
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

func rename_timer() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[23])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a CronometroMensaje",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_child(3)
			if node == null:
				return 0
			return 1 if node.name == "CronometroMensaje" else 0
	)
	complete_step()

func select_score_label() -> void:
	highlight_scene_nodes_by_name(["PuntuaciónEtiqueta"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[24])
	bubble_set_title("Texto")
	bubble_add_text(
		["Vamos a hacer unos ajustes al nodo PuntuaciónEtiqueta."]
	)
	bubble_add_task_select_node("PuntuaciónEtiqueta")
	complete_step()

func change_font() -> void:
	highlight_inspector_properties(["text"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[25])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		["Para que el texto muestre algo escribe un numero."]
	)
	bubble_add_task(
		"Escribe un numero.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.text != "" else 0
	)
	complete_step()
	
	highlight_inspector_properties(["horizontal_alignment", "vertical_alignment"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[26])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		["Cambia la alineación del texto para que este quede centrado."]
	)
	bubble_add_task(
		"Cambia el Horizontal y Vertical a center.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.horizontal_alignment == HORIZONTAL_ALIGNMENT_CENTER && node.vertical_alignment == VERTICAL_ALIGNMENT_CENTER else 0
	)
	complete_step()
	
	#highlight_controls([interface.inspector_dock])
	highlight_filesystem_paths(["res://DodgeTheCreeps/fonts/Xolonium-Regular.ttf"])
	highlight_inspector_properties(["theme_override_fonts/font", "theme_override_font_sizes/font_size"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[27])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Fuente")
	bubble_add_text(
		["Para que el texto se vea mejor debes cambiar el tipo de fuente y el tamaño del mismo."]
	)
	bubble_add_task(
		"Cambia eñ tipo de fuente y el tamaño del texto a 64.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.has_theme_font_override("font") && node.get_theme_font_size("font_size") == 64 else 0
	)
	complete_step()

func change_layout() -> void:
	highlight_inspector_properties(["anchors_preset"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[28])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Disposición")
	bubble_add_text(
		["[fill]Por ultimo cambia su disposición para que el texto se muestre centrado en la parte superior de la pantalla[/fill]."]
	)
	bubble_add_task(
		"Cambia el layout preset a [b]Centro Superior[/b].",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(0)
			if node == null:
				return 0
			return 1 if node.anchors_preset == Control.PRESET_CENTER_TOP else 0
	)
	complete_step()

func select_message() -> void:
	highlight_scene_nodes_by_name(["Mensaje"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[29])
	bubble_set_title("Texto")
	bubble_add_text(
		["Ahora vamos a hacer unos ajustes a la etiqueta Mensaje."]
	)
	bubble_add_task_select_node("Mensaje")
	complete_step()
	
	highlight_inspector_properties(["text"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[30])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		['Escribe el texto "¡Esquiva Los Monstruos!" como pantalla de presentación.']
	)
	bubble_add_task(
		"Escribe ¡Esquiva Los Monstruos!",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.text == "¡Esquiva Los Monstruos!" else 0
	)
	complete_step()
	
	highlight_inspector_properties(["horizontal_alignment", "vertical_alignment"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[31])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		["Cambia la alineación del texto para que este quede centrado."]
	)
	bubble_add_task(
		"Cambia el Horizontal y Vertical a center.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.horizontal_alignment == HORIZONTAL_ALIGNMENT_CENTER && node.vertical_alignment == VERTICAL_ALIGNMENT_CENTER else 0
	)
	complete_step()
	
	highlight_inspector_properties(["autowrap_mode"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[32])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		["Para envolver el texto dentro del margen tienes que activar la opción [b]Autowrap[/b]."]
	)
	bubble_add_task(
		"Activa el Autowrap en [b]word[/b].",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.autowrap_mode == TextServer.AUTOWRAP_WORD else 0
	)
	complete_step()
	
	#highlight_controls([interface.inspector_dock])
	highlight_filesystem_paths(["res://DodgeTheCreeps/fonts/Xolonium-Regular.ttf"])
	highlight_inspector_properties(["theme_override_fonts/font", "theme_override_font_sizes/font_size"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[33])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Fuente")
	bubble_add_text(
		["Para que el texto se vea mejor debes cambiar el tipo de fuente y el tamaño del mismo."]
	)
	bubble_add_task(
		"Cambia el tipo de fuente y el tamaño del texto a 64.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.has_theme_font_override("font") && node.get_theme_font_size("font_size") == 64 else 0
	)
	complete_step()
	
	#highlight_controls([interface.inspector_dock])
	highlight_inspector_properties(["size"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[34])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Texto")
	bubble_add_text(
		["Cambia el tamaño de la etiqueta en el eje x a 480"]
	)
	bubble_add_task(
		"Cambia el tamaño en el eje x a 480.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.size.x == 480 else 0
	)
	complete_step()
	
	highlight_inspector_properties(["anchors_preset"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[35])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Disposición")
	bubble_add_text(
		["Por ultimo cambia su disposición para que el texto este en el centro de la pantalla."]
	)
	bubble_add_task(
		"Cambia el layout preset a [b]Centro[/b] para centrar la etiqueta.",
		false,
		1,
		func(task : Task) -> int:
			var node: Label = EditorInterface.get_edited_scene_root().get_child(1)
			if node == null:
				return 0
			return 1 if node.anchors_preset == Control.PRESET_CENTER else 0
	)
	complete_step()

func select_button() -> void:
	highlight_scene_nodes_by_name(["BotónInicio"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[36])
	bubble_set_title("Botón")
	bubble_add_text(
		["Ahora vamos a hacer unos ajustes al botón BotónInicio."]
	)
	bubble_add_task_select_node("BotónInicio")
	complete_step()
	
	highlight_inspector_properties(["text"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[39])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Botón")
	bubble_add_text(
		["Agrega como texto [b]Empezar[/b] al botón."]
	)
	bubble_add_task(
		"Escribe Empezar.",
		false,
		1,
		func(task : Task) -> int:
			var node: Button = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.text == "Empezar" else 0
	)
	complete_step()
	
	#highlight_controls([interface.inspector_dock])
	highlight_filesystem_paths(["res://DodgeTheCreeps/fonts/Xolonium-Regular.ttf"])
	highlight_inspector_properties(["theme_override_fonts/font", "theme_override_font_sizes/font_size"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[37])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Fuente")
	bubble_add_text(
		["Para que el texto se vea mejor debes cambiar el tipo de fuente y el tamaño del mismo."]
	)
	bubble_add_task(
		"Cambia el tipo de fuente y el tamaño del texto a 64.",
		false,
		1,
		func(task : Task) -> int:
			var node: Button = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.has_theme_font_override("font") && node.get_theme_font_size("font_size") == 64 else 0
	)
	complete_step()
	
	#highlight_controls([interface.inspector_dock])
	highlight_inspector_properties(["size"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[38])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Botón")
	bubble_add_text(
		["Cambia el tamaño del botón en Y a 100"]
	)
	bubble_add_task(
		"Cambia el tamaño de Y a 100.",
		false,
		1,
		func(task : Task) -> int:
			var node: Button = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.size.y == 100 else 0
	)
	complete_step()
	
	highlight_inspector_properties(["anchors_preset"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[40])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Disposición")
	bubble_add_text(
		["Cambia la disposición del botón para que este quede centrado."]
	)
	bubble_add_task(
		"Cambia el layout preset a [b]Centro Inferior[/b].",
		false,
		1,
		func(task : Task) -> int:
			var node: Button = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.anchors_preset == Control.PRESET_CENTER_BOTTOM else 0
	)
	complete_step()
	
	highlight_inspector_properties(["position"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[41])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Disposición")
	bubble_add_text(
		["Por ultimo, cambia su posición en el eje Y"]
	)
	bubble_add_task(
		"Cambia el valor de Y a 580.",
		false,
		1,
		func(task : Task) -> int:
			var node: Button = EditorInterface.get_edited_scene_root().get_child(2)
			if node == null:
				return 0
			return 1 if node.position.y == 580 else 0
	)
	complete_step()

func change_time() -> void:
	highlight_scene_nodes_by_name(["CronometroMensaje"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[42])
	bubble_set_title("Timer")
	bubble_add_text(
		["Vamos a hacer unos ajustes al temporizador."]
	)
	bubble_add_task_select_node("CronometroMensaje")
	complete_step()
	
	highlight_inspector_properties(["wait_time", "one_shot"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[43])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Cambia el tiempo de espera a 2 y activa el one shot para que se active solo una vez."]
	)
	bubble_add_task(
		"Cambia el wait time a 2 y activa el one shot.",
		false,
		1,
		func(task : Task) -> int:
			var node: Timer = EditorInterface.get_edited_scene_root().get_child(3)
			if node == null:
				return 0
			return 1 if node.wait_time == 2 && node.one_shot else 0
	)
	complete_step()

func create_script() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[44])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Es hora de comenzar a agregar un script a la interfaz.",
		"Selecciona al nodo raíz HUD."]
	)
	bubble_add_task_select_node("HUD")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[45])
	highlight_controls([interface.scene_dock_button_script])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Ahora presiona el botón de crear script."]
	)
	bubble_add_task(
		"Presiona el botón.",
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_script.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[46])
	highlight_controls([interface.script_create_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Presiona el botón crear para confirmar."]
	)
	bubble_add_task(
		"Presional el botón crear.",
		false,
		1,
		func(task : Task) -> int:
			interface.script_create_window.config("CanvasLayer", "res://DodgeTheCreeps/hud.gd")
			if interface.script_create_button_create.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()

func connect_signals() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[47])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo BotónInicio."]
	)
	bubble_add_task_select_node("BotónInicio")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[48])
	highlight_controls([interface.node_tabs])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Nodo."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Nodo.")
	complete_step()
	
	highlight_signals(["pressed()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[49])
	highlight_controls([interface.node_dock_connect_button])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Selecciona esta señal y presiona el botón Conectar"
	])
	bubble_add_task(
		"Presiona el botón Conectar.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_connect_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[50])
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Conecta la señal al script."
	])
	bubble_add_task(
		"Presiona el botón connect.",
		false,
		1,
		func(task : Task) -> int:
			if interface.signals_dialog_ok_button.button_pressed == true:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[51])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo CronometroMensaje."]
	)
	bubble_add_task_select_node("CronometroMensaje")
	complete_step()
	
	highlight_signals(["timeout()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[52])
	highlight_controls([interface.node_dock_connect_button])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Selecciona esta señal y presiona el botón Conectar"
	])
	bubble_add_task(
		"Presiona el botón Conectar.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_connect_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[53])
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Conecta la señal al script."
	])
	bubble_add_task(
		"Presiona el botón connect.",
		false,
		1,
		func(task : Task) -> int:
			if interface.signals_dialog_ok_button.button_pressed == true:
				next()
				return 1
			return 0
	)
	complete_step()

func coding() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[54])
	var code := "func _ready():
	nuevo_juego()"
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		["Ya no necesitaremos llamar a la función [b]nuevo_juego[/b] al iniciar el juego por lo que puedes eliminarla."]
	)
	bubble_add_code([code])
	bubble_add_task(
		"Elimina toda la función _ready",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text
			return 1 if !current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[55])
	code = "signal iniciar_juego"
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		["Declara la siguiente señal."]
	)
	bubble_add_code([code])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[56])
	code = "func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$CronometroMensaje.start()"
	highlight_controls([interface.script_editor_code_panel])
	bubble_set_title("Programar")
	bubble_add_text(
		['Ahora queremos mostrar un mensaje temporalmente, como "¡Preparate!", por lo que debes agregar el siguiente código.']
	)
	bubble_add_code([code])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			code = code.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[57])
	code = 'func mostrar_fin_del_juego():
	mostrar_mensaje("Fin Del Juego")
	await $CronometroMensaje.timeout
	
	$Mensaje.text = "¡Esquiva Los Monstruos!"
	$Mensaje.show()
	await get_tree().create_timer(1.0).timeout
	$"BotónInicio".show()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_set_title("Programar")
	bubble_add_text(
		['[fill]También debes procesar lo que sucede cuando el jugador pierde. El código que aparece a continuación mostrará "Fin Del Juego" durante 2 segundos, luego volverá a la pantalla de título y, después de una breve pausa, mostrará el botón "Empezar".[/fill]']
	)
	bubble_add_code([code])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			code = code.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[58])
	code = 'func actualizar_puntuacion(puntuacion):
	$"PuntuaciónEtiqueta".text = str(puntuacion)'
	highlight_controls([interface.script_editor_code_panel])
	bubble_set_title("Programar")
	bubble_add_text(
		["Añade el código a continuación al HUD para actualizar la puntuación."]
	)
	bubble_add_code([code])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			code = code.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[59])
	code = 'func _on_botón_inicio_pressed():
	$"BotónInicio".hide()
	iniciar_juego.emit()

func _on_cronometro_mensaje_timeout():
	$Mensaje.hide()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		["Agrega el siguiente código a las funciones con señal conectada."]
	)
	bubble_add_code([code])
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

func save_scene() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[60])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Ahora para guardar la escena presiona CTRL + s a la vez."]
	)
	bubble_add_task(
		"CTRL + S.",
		false,
		1,
		func(task : Task) -> int:
			if interface.save_window.visible:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[61])
	highlight_controls([interface.save_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Haz doble click sobre la carpeta DodgeTheCreeps para habrirla."]
	)
	bubble_add_task(
		"Abre DodgeTheCreeps",
		false,
		1,
		func(task : Task) -> int:
			return 1 if interface.save_window.current_dir == "res://DodgeTheCreeps" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[62])
	highlight_controls([interface.save_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Ahora presiona el botón save para confirmar el guardado."]
	)
	bubble_add_task_press_button(interface.save_ok_button, "Presiona el botón save")
	complete_step()

func instantiate_scene() -> void:
	scene_open("res://DodgeTheCreeps/principal.tscn")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[63])
	highlight_controls([interface.scene_dock_button_instance])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Instanciar escena")
	bubble_add_text(
		["Por ultimo, debes agregar la escena de la interfaz de usuario a la escena principal."]
	)
	bubble_add_task(
		"Instancia la escena HUD.",
		false,
		1,
		func(task : Task) -> int:
			EditorInterface.edit_node(EditorInterface.get_edited_scene_root())
			if interface.scene_dock_button_instance.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[64])
	highlight_controls([interface.instance_search_bar, interface.instance_open_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Instanciar escena")
	bubble_add_text(
		["Busca la escena de la interfaz de usuario y ábrela para instanciarla en la escena principal."]
	)
	bubble_add_task(
		"Busca [b]hud[/b] y presional el botón open.",
		false,
		1,
		func(task : Task) -> int:
			if interface.instance_search_bar.text == "hud" && interface.instance_open_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()

func add_more_code() -> void:
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[65])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Ahora necesitamos conectar la funcionalidad del [b]HUD[/b] a nuestro script principal. Esto requiere algunas adiciones a la escena principal.",
		"Selecciona el nodo [b]HUD[/b]."]
	)
	bubble_add_task_select_node("HUD")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[66])
	highlight_controls([interface.node_tabs])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Node."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Nodo.")
	complete_step()
	
	highlight_signals(["iniciar_juego()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[67])
	highlight_controls([interface.node_dock_connect_button])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Selecciona esta señal y presiona el botón Conectar"
	])
	bubble_add_task(
		"Presiona el botón Conectar.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_connect_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[68])
	highlight_controls([interface.signals_dialog_ok_button, interface.signals_dialog_method_line_edit])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Por ultimo, debes renombrar la función y conectar la señal."
	])
	bubble_add_task(
		"Renombra a nuevo_juego y presiona el botón Conectar.",
		false,
		1,
		func(task : Task) -> int:
			if interface.signals_dialog_ok_button.button_pressed && interface.signals_dialog_method_line_edit.text == "nuevo_juego":
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[69])
	context_set_script()
	var code := 'func nuevo_juego():
	puntuacion = 0
	$Jugador.start($"PosiciónInicial".position)
	$CronometroInicio.start()
	$HUD.actualizar_puntuacion(puntuacion)
	$HUD.mostrar_mensaje("¡Preparate!")
	get_tree().call_group("enemigos", "queue_free")'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		['[fill]En la función nuevo_juego(), actualiza la visualización de la puntuación y muestra el mensaje "¡Preparate!"[/fill]',
		"[fill]La función call_group() llama a la función nombrada en cada nodo de un grupo; en este caso, le estamos diciendo a cada enemigo que se elimine a sí mismo.[/fill]"]
	)
	bubble_add_code(["$HUD.actualizar_puntuacion(puntuacion)",
	'$HUD.mostrar_mensaje("¡Preparate!")',
	'get_tree().call_group("enemigos", "queue_free")'])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			code = code.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[70])
	code = 'func fin_del_juego():
	$"CronometroPuntuación".stop()
	$CronometroEnemigo.stop()
	$HUD.mostrar_fin_del_juego()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		["En la función fin_del_juego() necesitas llamar a la función HUD correspondiente."]
	)
	bubble_add_code(["$HUD.mostrar_fin_del_juego()"])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[71])
	code = "func _on_cronometro_puntuación_timeout():
	puntuacion += 1
	$HUD.actualizar_puntuacion(puntuacion)"
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text(
		["Por último, agregue esto a _on_cronometro_puntuación_timeout() para mantener la pantalla sincronizada con el cambio de puntuación."]
	)
	bubble_add_code(["$HUD.actualizar_puntuacion(puntuacion)"])
	bubble_add_task(
		"Copia el código",
		false,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var base := script_editors[index]
			var current_code : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			code = code.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[72])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["No olvides guardar los cambios."]
	)
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
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[73])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Casi terminado")
	bubble_add_text(
		["El juego está prácticamente terminado hasta este punto. En la siguiente y última parte, lo perfeccionaremos un poco agregando un fondo, música en bucle y algunos atajos de teclado."]
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
