extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg"
}

const CURRENT_LESSON := "errores"

const DIALOGUES = preload("res://addons/godot-course/lessons/errores/errores.tres")

const ERROR_SINTAXIS := preload("res://addons/godot-course/lessons/errores/imagenes/error_sintaxis.png")
const ERROR_EJECUCION := preload("res://addons/godot-course/lessons/errores/imagenes/error_ejecucion.png")
const ERROR_DIVISION_ENTRE_CERO := preload("res://addons/godot-course/lessons/errores/imagenes/error_division_entre_cero.png")
const ADVERTENCIAS := preload("res://addons/godot-course/lessons/errores/imagenes/advertencias.png")

func _build() -> void:
	init()
	intro()
	what_is()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_progress_value(3)

func intro() -> void:
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Errores")
	bubble_add_text(
		["[center]En esta lección aprenderás sobre los errores de código.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_is() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("¿Qué son los Errores?")
	bubble_add_text(
		["[fill]Hasta este punto ya habrás convivido con los errores de código, ya que estos impiden que el programa funcione correctamente.[/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Sitaxis")
	bubble_add_text(
		["[fill]Existen varios tipos de errores por un lado están los de sintaxis[/fill].",
		"[fill]Esto son cuando el código no sigue las reglas del lenguaje de programación[/fill]."]
	)
	bubble_add_texture(ERROR_SINTAXIS, Vector2(700, 500))
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Ejecución")
	bubble_add_text(
		["[fill]Luego están los errores de ejecución cuando el código intenta hacer algo que no puede, como dividir por cero o acceder a una variable que no existe.[/fill]"]
	)
	bubble_add_texture(ERROR_EJECUCION, Vector2(700, 500))
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Advertencias")
	bubble_add_text(
		["[fill]Las advertencias son otro tipo de error, estos indican posibles problemas en el código, pero no impiden que el programa se ejecute.[/fill]"]
	)
	bubble_add_texture(ADVERTENCIAS, Vector2(700, 500))
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	tabs_set_to_index(interface.main_screen_tabs, 0)
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Advertencias")
	bubble_add_text(
		["[fill]Las advertencias suelen señalar prácticas que podrían llevar a errores futuros, como el uso de variables no inicializadas o funciones obsoletas.[/fill]"]
	)
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Division")
	bubble_add_text(
		["[fill]En algunos lenguajes la división entre cero da un error, pero en GDScript es algo diferente, ya que si haces la división entre enteros este si te dará un error.[/fill]"]
	)
	bubble_add_texture(ERROR_DIVISION_ENTRE_CERO, Vector2(700, 500))
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Division")
	bubble_add_text(
		["[fill]Pero si lo haces entre decimales Godot no dará errores y si compruebas su valor este será [b]inf[/b].[/fill]"]
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
