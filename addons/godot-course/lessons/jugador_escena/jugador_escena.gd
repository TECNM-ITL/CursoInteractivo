extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	add = "res://addons/godot-course/ui/icons/add.svg",
	group = "res://addons/godot-course/ui/icons/Group.svg",
	new = "res://addons/godot-course/ui/icons/New.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/jugador_escena/jugador_escena.tres")

const CURRENT_LESSON := "jugador_escena"
const NEXT_LESSON := "programar_jugador"

const SPRITE_FRAMES := preload("res://addons/godot-course/lessons/jugador_escena/videos/sprite_frames.ogv")
const ADD_FRAME := preload("res://addons/godot-course/lessons/jugador_escena/videos/add_frame.ogv")
const AREA := preload("res://addons/godot-course/lessons/jugador_escena/videos/area.ogv")
const ANIMATED_SPRITE := preload("res://addons/godot-course/lessons/jugador_escena/videos/animated_sprite.ogv")

func _build() -> void:
	init()
	intro()
	add_area_2d()
	what_is_area_2d()
	rename_node()
	group_nodes()
	add_animated_sprite()
	what_is_animated_sprite()
	sprite_frames()
	change_scale()
	add_collision()
	add_collision_shape()
	save_player()
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
	bubble_set_title("Jugador")
	bubble_add_text(
		["[center]En esta lección empezaremos a armar nuestro jugador.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func add_area_2d() -> void:
	highlight_controls([interface.scene_dock_button_add], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Area2D")
	bubble_add_text(
		["Abre el menú de crear nuevo nodo."]
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
	
	highlight_controls([interface.node_create_panel], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Area2D")
	bubble_add_text(
		["Vamos a agregar el nodo Area2D a nuestra escena."]
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_set_title("Area2D")
	bubble_add_text(
		["En la barra de búsqueda escribe Area2D."]
	)
	bubble_add_task(
		"Escribe Area2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "area2d":
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Area2D")
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

func what_is_area_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["[fill]Un Area2D define una región del espacio 2D. En este espacio puede detectar otros nodos CollisionObject2D superpuestos, entrando y saliendo. Las áreas también permiten anular las propiedades físicas locales.[/fill]"]
	)
	bubble_add_video(AREA)
	complete_step()

func rename_node() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Renombrar")
	bubble_add_text(
		["Ahora haz doble click sobre el nodo para poder cambiar su nombre."]
	)
	bubble_add_task(
		"Cambia el nombre a Jugador",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root()
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "Jugador" else 0
	)
	complete_step()

func group_nodes() -> void:
	scene_select_nodes_by_path(["Jugador"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.scene_tree, interface.canvas_item_editor_toolbar_group_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agrupar")
	bubble_add_text(
		["Para que evites mover los nodos hijos del Jugador, este botón los agrupara a todos como uno solo."]
	)
	bubble_add_task_press_button(interface.canvas_item_editor_toolbar_group_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.group))
	complete_step()

func add_animated_sprite() -> void:
	highlight_controls([interface.scene_dock_button_add], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("AnimatedSprite2D")
	bubble_add_text(
		["Vamos a agregar otro nodo a la escena.",
		"Abre el menú de crear nuevo nodo."]
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
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AnimatedSprite2D")
	bubble_add_text(
		["En la barra de búsqueda escribe AnimatedSprite2D."]
	)
	bubble_add_task(
		"Escribe AnimatedSprite2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "animatedsprite2d":
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AnimatedSprite2D")
	bubble_add_text(
		["Bien ahora puedes agregar el nodo a la escena."]
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

func what_is_animated_sprite() -> void:
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["Es un Nodo Sprite que contiene múltiples texturas como fotogramas para reproducir en la animación."]
	)
	bubble_add_video(ANIMATED_SPRITE)
	complete_step()

func sprite_frames() -> void:
	highlight_scene_nodes_by_path(["Jugador/AnimatedSprite2D"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	highlight_controls([interface.inspector_editor])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("SpriteFrames")
	bubble_add_video(SPRITE_FRAMES)
	bubble_add_task(
		"Crea un nuevo recurso y abre el editor SpriteFrames.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: Node = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			if anim_node == null:
				return 0
			return 1 if anim_node.sprite_frames != null && interface.sprite_frames.visible else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	highlight_controls([interface.sprite_frames])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("SpriteFrames")
	bubble_add_text(
		["Este es el editor SpriteFrame para poder crear y editar nuestras animaciones."]
	)
	complete_step()
	
	highlight_filesystem_paths(["res://DodgeTheCreeps", "res://DodgeTheCreeps/art", "res://DodgeTheCreeps/art/jugador_arriba1.png", "res://DodgeTheCreeps/art/jugador_arriba2.png"], false)
	highlight_controls([interface.sprite_frames_panel])
	bubble_set_avatar_dialog(null)
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar frames")
	bubble_add_video(ADD_FRAME)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	highlight_controls([interface.sprite_frames_animation_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Renombrar")
	bubble_add_text(
		['Renombra la animación por defecto como "arriba" haciendo doble click sobre este.']
	)
	bubble_add_task(
		"Renombra a arriba.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: AnimatedSprite2D = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			var sprite_frames: SpriteFrames = anim_node.sprite_frames
			var animations_name := sprite_frames.get_animation_names()
			return 1 if animations_name[0] == "arriba" else 0
	)
	complete_step()
	
	highlight_controls([interface.sprite_frames_add_button], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Nueva animación")
	bubble_add_text(
		["Bien, ahora vamos a agregar otra animación."]
	)
	bubble_add_task_press_button(interface.sprite_frames_add_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.new))
	complete_step()
	
	highlight_controls([interface.sprite_frames_animation_panel])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Renombrar")
	bubble_add_text(
		['También debes renombrar esta animación como "caminar".',
		"Haz doble click sobre new."]
	)
	bubble_add_task(
		"Renombra a caminar.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: AnimatedSprite2D = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			var sprite_frames: SpriteFrames = anim_node.sprite_frames
			var animations_name := sprite_frames.get_animation_names()
			return 1 if animations_name[1] == "caminar" else 0
	)
	complete_step()
	
	highlight_filesystem_paths(["res://DodgeTheCreeps", "res://DodgeTheCreeps/art", "res://DodgeTheCreeps/art/jugador_caminar1.png", "res://DodgeTheCreeps/art/jugador_caminar2.png"], false)
	highlight_controls([interface.sprite_frames_panel])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar frames")
	bubble_add_text(["Como la animación anterior arrastra los sprites correspondientes."])
	complete_step()

func change_scale() -> void:
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Cambiar tamaño")
	bubble_add_text(
		["Bien, ya configuraste las animaciones.",
		"Ahora selecciona al nodo raíz Jugador."]
	)
	bubble_add_task_select_node("Jugador")
	complete_step()
	
	highlight_inspector_properties(["scale"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Cambiar tamaño")
	bubble_add_text(
		["Para que el jugador sea más pequeño, puedes cambiar su tamaño desde aquí."]
	)
	bubble_add_task(
		"Cambia el tamaño a 0.5.",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root()
			if scene_root == null:
				return 0
			return 1 if scene_root.scale == Vector2(0.5, 0.5) else 0
	)
	complete_step()

func add_collision() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("CollisionShape2D")
	bubble_add_text(
		["Por ultimo agrega una colisión al jugador."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[21])
	highlight_controls([interface.node_create_dialog_search_bar], true)
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("CollisionShape2D")
	bubble_add_text(
		["En la barra de búsqueda escribe CollisionShape2D."]
	)
	bubble_add_task(
		"Escribe CollisionShape2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "collisionshape2d":
				return 1
			return 0
	)
	complete_step()
	
	highlight_controls([interface.node_create_dialog_button_create], true)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[22])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("CollisionShape2D")
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
	
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[23])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["Es un nodo que proporciona una forma de colisión a un nodo padre que posee propiedades físicas."]
	)
	complete_step()

func add_collision_shape() -> void:
	highlight_scene_nodes_by_path(["Jugador/CollisionShape2D"])
	highlight_inspector_properties(["shape"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[24])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Crear colición")
	bubble_add_text(
		["Crea una colisión de tipo CapsuleShape2D."]
	)
	bubble_add_task(
		"Crea un CapsuleShape2D.",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_node("CollisionShape2D")
			if node == null:
				return 0
			if node.shape != null:
				return 1 if node.shape.is_class("CapsuleShape2D") else 0
			return 0
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Jugador/CollisionShape2D"])
	highlight_inspector_properties(["shape"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[25])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Cambia el tamaño")
	bubble_add_text(
		["Para ajustar el tamaño de la colisión con el personaje haz click sobre el recurso de shape."]
	)
	bubble_add_task(
		"Radius: 55 y Height: 140.",
		false,
		1,
		func(task : Task) -> int:
			var node: Node = EditorInterface.get_edited_scene_root().get_node("CollisionShape2D")
			if node == null:
				return 0
			if node.shape != null:
				return 1 if node.shape.radius == 55 && node.shape.height == 140 else 0
			return 0
	)
	complete_step()

func save_player() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[26])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Bien, ya tenemos la escena de nuestro jugador, ahora para guardar la escena presiona CTRL + s a la vez."]
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
	
	highlight_controls([interface.save_panel])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[27])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Este es el menu de guardar.",
		"Haz doble click sobre la carpeta DodgeTheCreeps para abrirla."]
	)
	bubble_add_task(
		"Abre DodgeTheCreeps",
		false,
		1,
		func(task : Task) -> int:
			return 1 if interface.save_window.current_dir == "res://DodgeTheCreeps" else 0
	)
	complete_step()
	
	highlight_controls([interface.save_ok_button])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[28])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Ahora presiona el botón guardar para confirmar el guardado."]
	)
	bubble_add_task_press_button(interface.save_ok_button, "Presiona el botón guardar")
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
