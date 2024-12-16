extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/proyecto/proyecto.tres")

const CURRENT_LESSON := "proyecto"
const NEXT_LESSON := "jugador_escena"

func _build() -> void:
	init()
	intro()
	warning()
	project_settings()
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
	bubble_set_title("Tu primer juego 2D")
	bubble_add_text(
		["[center]En esta lección iniciaremos con la creación de tu primer videojuego.[/center]", 
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func warning() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¡Advertencia!")
	bubble_add_text(
		["[fill][b]Antes de comenzar el proyecto asegurate de realizarlo en un dispositivo de confianza, ya que no se almacenara en la nube y no podrás recuperar el avance en otro dispositivo.[/b][/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.BOTTOM_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	highlight_filesystem_paths(["res://DodgeTheCreeps"], true)
	bubble_add_text(
		['[fill][b]Una forma de recuperar el progreso es copiar la carpeta "DodgeTheCreeps" desde el dispositivo donde tienes tu progreso y pasarlo a tu dispositivo actual.[/b][/fill]']
	)
	complete_step()

func project_settings() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.menu_bar])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Configuración de proyecto")
	bubble_add_text(
		["Necesitamos configurar algunas cosas del proyecto.",
		"Presiona el botón Project y selecciona Project Settings..."]
	)
	bubble_add_task(
		"Abre ProjectSettings",
		false,
		1,
		func(task : Task) -> int:
			if interface.project_settings_window.visible:
				next()
				return 1
			return 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.project_settings_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Configuración de proyecto")
	bubble_add_text(
		["Este es el menú de ProjectSettings."]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.project_settings_search_bar])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Configuración de proyecto")
	bubble_add_text(
		["Necesitas buscar un apartado en la barra de búsqueda para configurar el tamaño de la ventana."]
	)
	bubble_add_task(
		"Escribe window.",
		false,
		1,
		func(task : Task) -> int:
			var search := interface.project_settings_search_bar.text.to_lower()
			return 1 if search == "window" else 0
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	highlight_controls([interface.project_settings_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Configuración de proyecto")
	bubble_add_text(
		["Ahora en Viewport cambia el ancho en 480 y el alto en 720."]
	)
	bubble_add_task(
		"Ingresa 480x720.",
		false,
		1,
		func(task : Task) -> int:
			var resolution := Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"), ProjectSettings.get_setting("display/window/size/viewport_height"))
			if resolution == Vector2(480, 720):
				interface.project_settings_window.visible = false
				return 1
			return 0
	)
	complete_step()

func outro() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Resolución")
	bubble_add_text(
		["Muy bien, estos cambios harán que la perspectiva del juego se adapte a un estilo de móviles."]
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
