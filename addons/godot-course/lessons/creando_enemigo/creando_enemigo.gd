extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	add = "res://addons/godot-course/ui/icons/add.svg",
	add_anim = "res://addons/godot-course/ui/icons/New.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/creando_enemigo/creando_enemigo.tres")

const CURRENT_LESSON := "creando_enemigo"
const NEXT_LESSON := "escena_principal"

const RIGIDBODY := preload("res://addons/godot-course/lessons/creando_enemigo/videos/rigidbody.ogv")
const VISIBLE_ON_SCREEN := preload("res://addons/godot-course/lessons/creando_enemigo/videos/visible_on_screen.ogv")

func _build() -> void:
	init()
	intro()
	add_rigid_body_2d()
	what_is_rigid_body()
	rename_node()
	add_animated_sprite()
	sprite_frames()
	add_visible_on_screen()
	what_is_visible_on_screen()
	add_collision()
	add_collision_shape()
	collision_mask()
	set_gravity()
	create_script()
	coding()
	add_group()
	save_enemy()
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
	bubble_set_title("Enemigo")
	bubble_add_text(
		["[center]En esta lección empezaremos a armar el enemigo.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func add_rigid_body_2d() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("RigidBody2D")
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	highlight_controls([interface.node_create_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("RigidBody2D")
	bubble_add_text(
		["Vamos a agregar el nodo RigidBody2D a nuestra escena."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_set_title("RigidBody2D")
	bubble_add_text(
		["En la barra de búsqueda escribe RigidBody2D."]
	)
	bubble_add_task(
		"Escribe RigidBody2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "rigidbody2d":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("RigidBody2D")
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

func what_is_rigid_body() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["El nodo [b]RigidBody2D[/b] es aquel que está controlado directamente por el motor de física para simular el comportamiento de los objetos físicos."]
	)
	bubble_add_video(RIGIDBODY)
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
		"Cambia el nombre a Enemigo",
		false,
		1,
		func(task : Task) -> int:
			var scene_root: Node = EditorInterface.get_edited_scene_root()
			if scene_root == null:
				return 0
			return 1 if scene_root.name == "Enemigo" else 0
	)
	complete_step()

func add_animated_sprite() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.scene_dock_button_add])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AnimatedSprite2D")
	bubble_add_text(
		["En la barra de busqueda escribe AnimatedSprite2D."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("AnimatedSprite2D")
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

func sprite_frames() -> void:
	highlight_scene_nodes_by_path(["Player/AnimatedSprite2D"])
	highlight_controls([interface.inspector_editor])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("SpriteFrames")
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
	
	highlight_controls([interface.sprite_frames])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("SpriteFrames")
	bubble_add_text(
		["[fill]Ya conoces la función de este editor, por lo que haremos lo mismo que se hizo con el jugador pero ahora con el enemigo.[/fill]."]
	)
	complete_step()
	
	highlight_filesystem_paths(["res://DodgeTheCreeps", "res://DodgeTheCreeps/art", "res://DodgeTheCreeps/art/enemigoCaminar_1.png", "res://DodgeTheCreeps/art/enemigoCaminar_2.png"], false)
	bubble_set_avatar_dialog(null)
	highlight_controls([interface.sprite_frames_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar frames")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	highlight_controls([interface.sprite_frames_animation_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Renombrar")
	bubble_add_text(
		['Renombra la animación por defecto como "caminar" haciendo doble click sobre este.']
	)
	bubble_add_task(
		"Renombra a caminar.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: AnimatedSprite2D = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			var sprite_frames: SpriteFrames = anim_node.sprite_frames
			var animations_name := sprite_frames.get_animation_names()
			return 1 if animations_name.has("caminar") else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	highlight_controls([interface.sprite_frames_add_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Nueva animación")
	bubble_add_text(
		["Bien, ahora vamos a agregar otra animación."]
	)
	bubble_add_task_press_button(interface.sprite_frames_add_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add_anim))
	complete_step()
	
	highlight_filesystem_paths(["res://DodgeTheCreeps", "res://DodgeTheCreeps/art", "res://DodgeTheCreeps/art/enemigoNadar_1.png", "res://DodgeTheCreeps/art/enemigoNadar_2.png"], false)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	highlight_controls([interface.sprite_frames_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar frames")
	bubble_add_text(
		["Arrastra los archivos indicados en el sistema de archivos hasta panel."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
	highlight_controls([interface.sprite_frames_animation_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Renombrar")
	bubble_add_text(
		['Tambien debes renombrar esta animación como "nadar"',
		"Haz doble click sobre new."]
	)
	bubble_add_task(
		"Renombra a nadar.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: AnimatedSprite2D = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			var sprite_frames: SpriteFrames = anim_node.sprite_frames
			var animations_name := sprite_frames.get_animation_names()
			return 1 if animations_name.has("nadar") else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	highlight_controls([interface.sprite_frames_add_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Nueva animación")
	bubble_add_text(
		["Ya por ultimo, vamos a agregar otra animación."]
	)
	bubble_add_task_press_button(interface.sprite_frames_add_button, "Presiona " + bbcode_generate_icon_image_string(ICONS_MAP.add_anim))
	complete_step()
	
	highlight_filesystem_paths(["res://DodgeTheCreeps", "res://DodgeTheCreeps/art", "res://DodgeTheCreeps/art/enemigoVuelo_1.png", "res://DodgeTheCreeps/art/enemigoVuelo_2.png"], false)
	bubble_set_avatar_dialog(null)
	highlight_controls([interface.sprite_frames_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Agregar frames")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	highlight_controls([interface.sprite_frames_animation_panel])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Renombrar")
	bubble_add_text(
		['Esta animación debes renombrarla como "volar".',
		"Haz doble click sobre new."]
	)
	bubble_add_task(
		"Renombra a volar.",
		false,
		1,
		func(task : Task) -> int:
			var anim_node: AnimatedSprite2D = EditorInterface.get_edited_scene_root().get_node("AnimatedSprite2D")
			var sprite_frames: SpriteFrames = anim_node.sprite_frames
			var animations_name := sprite_frames.get_animation_names()
			return 1 if animations_name.has("volar") else 0
	)
	complete_step()

func add_collision() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo raíz."]
	)
	bubble_add_task_select_node("Enemigo")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("CollisionShape2D")
	bubble_add_text(
		["El enemigo necesita una colisión por lo que hay que agregarle una."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	highlight_controls([interface.node_create_dialog_search_bar])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[21])
	highlight_controls([interface.node_create_dialog_button_create])
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

func add_collision_shape() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[22])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Crear forma")
	bubble_add_text(
		["Es hora de agregarle una forma de colisión a nuestro enemigo."]
	)
	complete_step()
	
	highlight_scene_nodes_by_path(["Enemigo/CollisionShape2D"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[23])
	highlight_inspector_properties(["shape"])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Crear forma")
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
	
	highlight_scene_nodes_by_path(["Enemigo/CollisionShape2D"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[24])
	highlight_inspector_properties(["shape"])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
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

func add_visible_on_screen() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[25])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo raíz."]
	)
	bubble_add_task_select_node("Enemigo")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[26])
	highlight_controls([interface.scene_dock_button_add])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("VisibleOnScreenNotifier2D")
	bubble_add_text(
		["Por ultimo agrega un notificador al enemigo."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[27])
	highlight_controls([interface.node_create_dialog_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("VisibleOnScreenNotifier2D")
	bubble_add_text(
		["En la barra de búsqueda escribe VisibleOnScreenNotifier2D."]
	)
	bubble_add_task(
		"Escribe VisibleOnScreenNotifier2D.",
		false,
		1,
		func(task : Task) -> int:
			var node_text := interface.node_create_dialog_search_bar.text.to_lower()
			if node_text == "visibleonscreennotifier2d":
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[28])
	highlight_controls([interface.node_create_dialog_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("VisibleOnScreenNotifier2D")
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

func what_is_visible_on_screen() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[29])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("¿Qué es?")
	bubble_add_text(
		["[fill][b]VisibleOnScreenEnabler2D[/b] representa una región rectangular del espacio 2D. Cuando cualquier parte de esta región se vuelve visible en la pantalla o en una ventana gráfica, emitirá una señal de [b]screen_entered[/b], y de la misma manera emitirá una señal de [b]screen_exited[/b] cuando ninguna parte de ella permanezca visible.[/fill]"]
	)
	bubble_add_video(VISIBLE_ON_SCREEN)
	complete_step()

func collision_mask() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[30])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo raíz."]
	)
	bubble_add_task_select_node("Enemigo")
	complete_step()
	
	highlight_inspector_properties(["collision_mask"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[31])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_add_text(
		["Para evitar que él los enemigos choquen entre si debes des enmarcar la capa 1."]
	)
	bubble_add_task(
		"Desenmarca la mascara 1.",
		false,
		1,
		func(task : Task) -> int:
			var node: RigidBody2D = EditorInterface.get_edited_scene_root()
			return 1 if node.collision_mask == 0 else 0
	)
	complete_step()

func set_gravity() -> void:
	highlight_inspector_properties(["gravity_scale"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[32])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Cambia la gravedad")
	bubble_add_text(
		["Para evitar que el enemigo caiga del escenario debes poner su gravedad en 0."]
	)
	bubble_add_task(
		"Pon la gravedad en 0.0",
		false,
		1,
		func(task : Task) -> int:
			var node: RigidBody2D = EditorInterface.get_edited_scene_root()
			return 1 if node.gravity_scale == 0 else 0
	)
	complete_step()

func create_script() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[33])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Es momento de programar al enemigo, pero para eso debes crear un script.",
		"Selecciona al nodo raíz Enemigo."]
	)
	bubble_add_task_select_node("Enemigo")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[34])
	highlight_controls([interface.scene_dock_button_script])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Bien, ahora solo falta presionar el botón de crear script."]
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[35])
	highlight_controls([interface.script_create_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Ahora presiona el botón crear para confirmar."]
	)
	bubble_add_task(
		"Presiona el botón.",
		false,
		1,
		func(task : Task) -> int:
			if interface.script_create_button_create.button_pressed:
				interface.script_create_window.config("RigidBody2D", "res://DodgeTheCreeps/enemigo.gd")
				next()
				return 1
			return 0
	)
	complete_step()

func coding() -> void:
	var code := "func _ready():
	var nombres_animaciones = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(nombres_animaciones[randi() % nombres_animaciones.size()])"
	highlight_controls([interface.script_editor_code_panel])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[36])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Programar")
	bubble_add_text([
		'[fill]Primero, obtenemos la lista de nombres de animaciones de la propiedad [b]sprite_frames[/b] de [b]AnimatedSprite2D[/b]. Esto devuelve una lista que contiene los tres nombres de animación: ["caminar", "nadar", "volar"].[/fill]',
		'[fill]Luego debemos elegir un número aleatorio entre 0 y 2 para seleccionar uno de estos nombres de la lista (los índices de la matriz comienzan en 0). [b]randi() % n[/b] selecciona un número entero aleatorio entre 0 y n-1.[/fill]'
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[37])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Selecciona el nodo")
	bubble_add_text(
		["Selecciona el nodo Visible On Screen Notifier."]
	)
	bubble_add_task_select_node("VisibleOnScreenNotifier2D")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[38])
	highlight_controls([interface.node_tabs])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Nodo."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Node.")
	complete_step()
	
	highlight_signals(["screen_exited()"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[39])
	highlight_controls([interface.node_dock_connect_button])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Selecciona esta señal y presiona el botón Conectar."
	])
	bubble_add_task(
		"Presiona el botón Connect.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_connect_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[40])
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
	
	code = "func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()"
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[41])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"La última parte es hacer que los enemigos se eliminen a sí mismos cuando salen de la pantalla."
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

func add_group() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[42])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Grupos")
	bubble_add_text([
		"[fill]Si juegas hasta el fin del juego y luego comienzas un nuevo juego, es posible que los enemigos del juego anterior sigan en la pantalla. Sería mejor si todos desaparecieran al comienzo de un nuevo juego. Necesitas una forma de decirle a todos los enemigos que se retiren. Puedes hacer esto con la función grupo.[/fill]",
		"Selecciona al nodo raíz."
	])
	bubble_add_task_select_node("Enemigo")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[43])
	highlight_controls([interface.node_dock_groups_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Grupos")
	bubble_add_text(
		["Ve al apartado de Grupos."]
	)
	bubble_add_task(
		"Ve a Groups.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_groups_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[44])
	highlight_controls([interface.node_dock_groups_add_line, interface.node_dock_groups_add_button])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Grupos")
	bubble_add_text(
		['Ahora añade un nuevo grupo llamado "enemigos".']
	)
	bubble_add_task(
		"Escribe [b]enemigos[/b] y añadelo.",
		false,
		1,
		func(task : Task) -> int:
			if interface.node_dock_groups_add_line.text == "enemigos" && interface.node_dock_groups_add_button.button_pressed:
				next()
				return 1
			return 0
	)
	complete_step()

func save_enemy() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[45])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[46])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[47])
	highlight_controls([interface.save_ok_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Guarda la escena")
	bubble_add_text(
		["Ahora presiona el botón guardar para confirmar el guardado."]
	)
	bubble_add_task_press_button(interface.save_ok_button, "Presiona el botón save")
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
