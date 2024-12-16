extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	add = "res://addons/godot-course/ui/icons/add.svg",
	instance = "res://addons/godot-course/ui/icons/instance.svg",
	script_create = "res://addons/godot-course/ui/icons/script_create.svg",
	snap = "res://addons/godot-course/ui/icons/Snap.svg",
	snap_grid = "res://addons/godot-course/ui/icons/SnapGrid.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/escena_principal/escena_principal.tres")

const CURRENT_LESSON := "escena_principal"
const NEXT_LESSON := "interfaz_usuario"

const PATH_TOOLBAR := preload("res://addons/godot-course/lessons/escena_principal/imagenes/path_toolbar.png")
const DRAW_PATH_2D := preload("res://addons/godot-course/lessons/escena_principal/videos/draw_path2d.ogv")
const TIMER := preload("res://addons/godot-course/lessons/escena_principal/videos/timer.ogv")
const PATH := preload("res://addons/godot-course/lessons/escena_principal/videos/path.ogv")

func _build() -> void:
	init()
	intro()
	add_node()
	rename_node()
	instance_scene()
	add_timer()
	what_is_a_timer()
	rename_timers()
	add_marker_2d()
	what_is_marker_2d()
	rename_marker_2d()
	change_time()
	add_path2d()
	what_is_path_2d()
	rename_path_2d()
	add_point()
	create_script()
	coding()
	connect_hit()
	connect_signal()
	signal_code()
	save_scene()
	run_game()
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
	bubble_set_title("La escena principal del juego.")
	bubble_add_text(
		["[center]En esta lección empezaremos a armar la escena principal del juego.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func add_node() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Node")
	bubble_add_text(
		["Agrega un nodo que servirá como nodo raíz."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add),
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
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Node")
	bubble_add_text(
		["En la barra de búsqueda escribe Node."]
	)
	bubble_add_task(
		"Escribe Node.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "node":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Node")
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

func rename_node() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a Principal",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root()
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "Principal" else 0
	)
	complete_step()

func instance_scene() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.scene_dock_button_instance])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Instance")
	bubble_add_text(
		["Haz click en el botón Instancia y selecciona la escena jugador.tscn."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.instance),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_instance.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	highlight_controls([interface.instance_panel], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Instance")
	bubble_add_text(
		["Este es el menú para instanciar escenas."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.instance_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Instance")
	bubble_add_text(
		["Escribe jugador en la barra de búsqueda."]
	)
	bubble_add_task(
		"Escribe jugador.",
		false,
		1,
		func(task : Task) -> int:
			return 1 if interface.instance_search_bar.text == "jugador" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	highlight_controls([interface.instance_open_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Instance")
	bubble_add_text(
		["Ahora solo presiona el botón abrir."]
	)
	bubble_add_task(
		"Presiona el botón abrir.",
		false,
		1,
		func(task : Task) -> int:
			if interface.instance_open_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()

func add_timer() -> void:
	highlight_scene_nodes_by_name(["Principal"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Selecciona el nodo Principal"]
	)
	bubble_add_task_select_node("Principal")
	complete_step()
	
	bubble_set_avatar_dialog(null)
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Agrega un timer."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	highlight_controls([interface.node_create_dialog_search_bar], true)
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	highlight_controls([interface.node_create_dialog_button_create], true)
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Ya que tienes el nodo Timer duplicalo 2 veces."]
	)
	bubble_add_task(
		"Presiona (CTRL + D) 2 veces.",
		false,
		1,
		func(task : Task) -> int:
			var scene_nodes := EditorInterface.get_edited_scene_root().find_children("", "Timer")
			return 1 if scene_nodes.size() == 3 else 0
	)
	complete_step()

func what_is_a_timer():
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Este nodo permite crear temporizadores en cuenta atrás en un intervalo específico."]
	)
	bubble_add_video(TIMER)
	complete_step()

func rename_timers() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Cambia el nombre del primer Timer."]
	)
	bubble_add_task(
		"Cambia el nombre a CronometroEnemigo",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root().get_child(1)
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "CronometroEnemigo" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Cambia el nombre del segundo Timer."]
	)
	bubble_add_task(
		"Cambia el nombre a CronometroPuntuación",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root().get_child(2)
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "CronometroPuntuación" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Cambia el nombre del tercer Timer."]
	)
	bubble_add_task(
		"Cambia el nombre a CronometroInicio",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root().get_child(3)
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "CronometroInicio" else 0
	)
	complete_step()

func add_marker_2d() -> void:
	highlight_scene_nodes_by_name(["Principal"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Timer")
	bubble_add_text(
		["Selecciona el nodo Principal"]
	)
	bubble_add_task_select_node("Principal")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Marker2D")
	bubble_add_text(
		["Agrega un nodo que servirá como referencia en la posición."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Marker2D")
	bubble_add_text(
		["En la barra de búsqueda escribe Marker2D."]
	)
	bubble_add_task(
		"Escribe Marker2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "marker2d":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Marker2D")
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

func what_is_marker_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[21])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Marker2D")
	bubble_add_text(
		["Este nodo no tiene mucho misterio solo ayudara como una referencia para la posición inicial del jugador."]
	)
	complete_step()

func rename_marker_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[22])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Cambia el nombre al Marker2D."]
	)
	bubble_add_task(
		"Cambia el nombre a PosiciónInicial",
		false,
		1,
		func(task : Task) -> int:
			var scene: Node = EditorInterface.get_edited_scene_root().get_child(4)
			return 1 if scene.name == "PosiciónInicial" else 0
	)
	complete_step()

func change_time() -> void:
	highlight_scene_nodes_by_name(["CronometroEnemigo"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[23])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Wait Time")
	bubble_add_text(["Selecciona el nodo CronometroEnemigo"])
	bubble_add_task_select_node("CronometroEnemigo")
	complete_step()
	
	highlight_inspector_properties(["wait_time"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[24])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Wait Time")
	bubble_add_task(
		"Cambia el tiempo por 0.5",
		false,
		1,
		func(task : Task) -> int:
			var timer_node : Timer = EditorInterface.get_edited_scene_root().get_node("CronometroEnemigo")
			return 1 if timer_node.wait_time == 0.5 else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[25])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Wait Time")
	bubble_add_text(["Selecciona el nodo CronometroInicio"])
	bubble_add_task_select_node("CronometroInicio")
	complete_step()
	
	highlight_inspector_properties(["wait_time"])
	bubble_set_avatar_dialog(null)
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Wait Time")
	bubble_add_task(
		"Cambia el tiempo por 2.0",
		false,
		1,
		func(task : Task) -> int:
			var timer_node : Timer = EditorInterface.get_edited_scene_root().get_node("CronometroInicio")
			return 1 if timer_node.wait_time == 2.0 else 0
	)
	complete_step()
	
	highlight_inspector_properties(["one_shot"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[26])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Wait Time")
	bubble_add_task(
		"Activa el one shot",
		false,
		1,
		func(task : Task) -> int:
			var timer_node : Timer = EditorInterface.get_edited_scene_root().get_node("CronometroInicio")
			return 1 if timer_node.one_shot else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[27])
	highlight_controls([interface.scene_dock])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Posición inicial")
	bubble_add_text(["Selecciona el nodo PosiciónInicial"])
	bubble_add_task_select_node("PosiciónInicial")
	complete_step()
	
	highlight_inspector_properties(["position"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[28])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Posición inicial")
	bubble_add_task(
		"Establece la posición en (240, 450)",
		false,
		1,
		func(task : Task) -> int:
			var node := EditorInterface.get_edited_scene_root().get_node("PosiciónInicial")
			return 1 if node.position == Vector2(240, 450) else 0
	)
	complete_step()

func add_path2d() -> void:
	highlight_scene_nodes_by_name(["Principal"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[29])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Selecciona el nodo Principal"]
	)
	bubble_add_task_select_node("Principal")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[30])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Agrega un nodo Path2D."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[31])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Path2D")
	bubble_add_text(
		["En la barra de búsqueda escribe Path2D."]
	)
	bubble_add_task(
		"Escribe Path2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "path2d":
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[32])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Path2D")
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
	
	highlight_scene_nodes_by_name(["Path2D"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[33])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["[fill]Este nodo por si solo no hace nada, ya que necesita de otro nodo para complementarlo.[/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[34])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("PathFollow2D")
	bubble_add_text(
		["Agrega un nodo PathFollow2D."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_add.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[35])
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("PathFollow2D")
	bubble_add_text(
		["En la barra de búsqueda escribe PathFollow2D."]
	)
	bubble_add_task(
		"Escribe PathFollow2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "pathfollow2d":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[36])
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("PathFollow2D")
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

func what_is_path_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[37])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["[fill]Este nodo es útil para hacer que otros nodos sigan un camino, sin codificar el patrón de movimiento. Para eso, los nodos deben ser hijos de este nodo. Los nodos descendientes se moverán en consecuencia al configurar el progreso en este nodo.[/fill]"]
	)
	bubble_add_video(PATH)
	complete_step()

func rename_path_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[38])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a UbicaciónApariciónEnemigo",
		false,
		1,
		func(task : Task) -> int:
			var path_2d := EditorInterface.get_edited_scene_root().get_child(5).get_child(0)
			if path_2d == null:
				return 0
			return 1 if path_2d.name == "UbicaciónApariciónEnemigo" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[39])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Selecciona al nodo Path."]
	)
	bubble_add_task_select_node("Path2D")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[40])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a EnemigoCamino",
		false,
		1,
		func(task : Task) -> int:
			var path_2d := EditorInterface.get_edited_scene_root().get_child(5)
			if path_2d == null:
				return 0
			return 1 if path_2d.name == "EnemigoCamino" else 0
	)
	complete_step()

func add_point() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[41])
	highlight_controls([interface.canvas_item_editor])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Debes crear puntos de generación para los enemigos con una ruta.", 
		"Para que los enemigos aparezcan en una ubicación aleatoria en el borde de la pantalla."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[42])
	highlight_controls([interface.canvas_item_editor_toolbar_grid_button, interface.canvas_item_editor_toolbar_smart_snap_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Para que los puntos se ajusten a la cuadrícula activa las siguientes opciones."]
	)
	bubble_add_task_press_button(interface.canvas_item_editor_toolbar_grid_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.snap))
	bubble_add_task_press_button(interface.canvas_item_editor_toolbar_smart_snap_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.snap_grid))
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[43])
	highlight_controls([interface.canvas_item_editor])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Verás algunos botones nuevos en la parte superior del editor."]
	)
	bubble_add_texture(PATH_TOOLBAR)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[44])
	highlight_controls([interface.canvas_item_editor])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Path2D")
	bubble_add_text(
		["Usa estas herramientas y sigue los siguientes pasos."]
	)
	bubble_add_video(DRAW_PATH_2D)
	bubble_add_task(
		"Crea el camino.",
		false,
		1,
		func(task : Task) -> int:
			var node := EditorInterface.get_edited_scene_root().get_child(5)
			var curve : Curve2D = node.curve
			var points : PackedVector2Array = [Vector2(0, 0), Vector2(480, 0), Vector2(480, 720), Vector2(0, 720), Vector2(0, 0)]
			if curve.point_count == 5:
				for i in curve.point_count:
					if points[i] != curve.get_point_position(i):
						break
					if i == 4:
						return 1
			return 0
	)
	complete_step()

func create_script() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[45])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Debes a agregar un script a el nodo Principal.",
		"Selecciona al nodo raíz Principal."]
	)
	bubble_add_task_select_node("Principal")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[46])
	highlight_controls([interface.scene_dock_button_script])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Ahora presiona el botón de crear script."]
	)
	bubble_add_task(
		"Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.script_create),
		false,
		1,
		func(task : Task) -> int:
			if interface.scene_dock_button_script.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[47])
	highlight_controls([interface.script_create_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Ahora presiona el botón crear para confirmar."]
	)
	bubble_add_task(
		"Presional el botón crear.",
		false,
		1,
		func(task : Task) -> int:
			interface.script_create_window.config("Node", "res://DodgeTheCreeps/principal.gd")
			if interface.script_create_button_create.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()

func coding() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[48])
	var code := "@export var enemigo_escena : PackedScene
var puntuacion"
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"En la parte superior del script, usamos [b]@export var enemigo_escena: PackedScene[/b] para permitirnos elegir la escena enemigo que queremos crear."
	])
	bubble_add_code([code])
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
	
	highlight_filesystem_paths(["res://DodgeTheCreeps/enemigo.tscn"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[49])
	highlight_inspector_properties(["enemigo_escena"])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Arrastra la escena enemigo hasta la propiedad del nodo."
	])
	bubble_add_task(
		"Arrastra la escena enemigo.",
		false,
		1,
		func(task : Task) -> int:
			var node := EditorInterface.get_edited_scene_root()
			return 1 if node.enemigo_escena != null else 0
	)
	complete_step()

func connect_hit() -> void:
	highlight_scene_nodes_by_name(["Jugador"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[50])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text(
		["Selecciona el nodo Jugador"]
	)
	bubble_add_task_select_node("Jugador")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[51])
	highlight_controls([interface.node_tabs])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Nodo."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Nodo.")
	complete_step()
	
	highlight_signals(["golpe()"])
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
	highlight_controls([interface.signals_dialog_ok_button, interface.signals_dialog_method_line_edit])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Por ultimo debes renombrar la función y conectar la señal."
	])
	bubble_add_task(
		"Renombra a fin_del_juego y presiona el botón Connect.",
		false,
		1,
		func(task : Task) -> int:
			if interface.signals_dialog_ok_button.button_pressed && interface.signals_dialog_method_line_edit.text == "fin_del_juego":
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[54])
	var code = 'func fin_del_juego():
	$"CronometroPuntuación".stop()
	$CronometroEnemigo.stop()

func nuevo_juego():
	puntuacion = 0
	$Jugador.start($"PosiciónInicial".position)
	$CronometroInicio.start()'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Agregue el siguiente código a la nueva función, así como una función llamada nuevo_juego que configurará todo para un nuevo juego."
	])
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

func connect_signal() -> void:
	highlight_scene_nodes_by_name(["CronometroInicio"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[55])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text(
		["Selecciona el nodo CronometroInicio"]
	)
	bubble_add_task_select_node("CronometroInicio")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[56])
	highlight_controls([interface.node_tabs])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Nodo."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Nodo.")
	interface.node_dock_signals_button.button_pressed = true
	
	highlight_signals(["timeout()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[57])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[58])
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Por ultimo conecta la señal en el script."
	])
	bubble_add_task_press_button(interface.signals_dialog_ok_button, "Presiona el botón connect.")
	complete_step()
	
	highlight_scene_nodes_by_name(["CronometroPuntuación"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[59])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text(
		["Selecciona el nodo CronometroPuntuación"]
	)
	bubble_add_task_select_node("CronometroPuntuación")
	complete_step()
	
	highlight_signals(["timeout()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[60])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[61])
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Por ultimo conecta la señal en el script."
	])
	bubble_add_task_press_button(interface.signals_dialog_ok_button, "Presiona el botón connect.")
	complete_step()
	
	highlight_scene_nodes_by_name(["CronometroEnemigo"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[62])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text(
		["Selecciona el nodo CronometroEnemigo"]
	)
	bubble_add_task_select_node("CronometroEnemigo")
	complete_step()
	
	highlight_signals(["timeout()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[63])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[64])
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Por ultimo conecta la señal en el script."
	])
	bubble_add_task_press_button(interface.signals_dialog_ok_button, "Presiona el botón connect.")
	complete_step()

func signal_code() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[65])
	var code := '
func _on_cronometro_inicio_timeout():
	$CronometroEnemigo.start()
	$"CronometroPuntuación".start()

func _on_cronometro_puntuación_timeout():
	puntuacion += 1'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Cada que pase 1 segundo se sumara 1 punto y habrá un pequeño retraso antes de que comience el juego."
	])
	bubble_add_code([code])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[66])
	code = '
func _on_cronometro_enemigo_timeout():
	var enemigo = enemigo_escena.instantiate()
	var enemigo_ubicacion_aparicion = $"EnemigoCamino/UbicaciónApariciónEnemigo"
	enemigo_ubicacion_aparicion.progress_ratio = randf()
	var direccion = enemigo_ubicacion_aparicion.rotation + PI / 2
	enemigo.position = enemigo_ubicacion_aparicion.position
	direccion += randf_range(-PI / 4, PI / 4)
	enemigo.rotation = direccion
	var velocidad = Vector2(randf_range(150.0, 250.0), 0.0)
	enemigo.linear_velocity = velocidad.rotated(direccion)
	add_child(enemigo)'
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"[fill]Crearemos una instancia del enemigo, elegiremos una ubicación de inicio aleatoria a lo largo del Path2D y pondremos al enemigo en movimiento. El nodo PathFollow2D rotará automáticamente a medida que sigue la ruta, por lo que lo usaremos para seleccionar la dirección del enemigo y su posición. Cuando generemos un enemigo, elegiremos un valor aleatorio entre 150.0 y 250.0 para determinar la velocidad a la que se moverá cada monstruo (sería aburrido si todos se movieran a la misma velocidad).[/fill]"
	])
	bubble_add_code([code])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[67])
	code = "func _ready():
	nuevo_juego()"
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Por ultimo para testear que la escena funciona coloca el siguiente código."
	])
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
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[68])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[69])
	highlight_controls([interface.save_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Este es el menu de guardar.",
		"Haz doble click sobre la carpeta DodgeTheCreeps para habrirla."]
	)
	bubble_add_task(
		"Abre DodgeTheCreeps",
		false,
		1,
		func(task : Task) -> int:
			return 1 if interface.save_window.current_dir == "res://DodgeTheCreeps" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[70])
	highlight_controls([interface.save_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Ahora presiona el botón save para confirmar el guardado."]
	)
	bubble_add_task_press_button(interface.save_ok_button, "Presiona el botón save")
	complete_step()

func run_game() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[71])
	highlight_controls([interface.run_bar_play_current_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Prueba el juego")
	bubble_add_text([
		"Para terminar puedes echar un vistazo a la escena."
	])
	bubble_add_task_press_button(interface.run_bar_play_current_button, "Prueba la escena.")
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
