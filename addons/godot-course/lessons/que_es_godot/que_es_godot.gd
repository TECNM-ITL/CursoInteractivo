extends "res://addons/godot-course/lesson.gd"

const CURRENT_LESSON := "que_es_godot"
const NEXT_LESSON := "editor_tour"

const DIALOGO_1 := preload("res://addons/godot-course/lessons/que_es_godot/dialogues/dialogo1.mp3")
const DIALOGO_2 := preload("res://addons/godot-course/lessons/que_es_godot/dialogues/dialogo2.mp3")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")
const GODOT_SHOWCASE := preload("res://addons/godot-course/lessons/que_es_godot/videos/godot-showcase.ogv")

func _build() -> void:
	init()
	what_is_godot()
	pronunciation()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(2)

func what_is_godot() -> void:
	context_set_2d()
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_avatar_dialog(DIALOGO_1)
	bubble_set_title("¿Qué es Godot?")
	bubble_add_text(
		["Quizás te estés preguntando ¿Qué es Godot?",
		"[fill]Godot es un motor de videojuegos 2D y 3D de propósito general diseñado para soportar todo tipo de proyectos.[/fill]",
		"[fill]Puedes usarlo para crear juegos o aplicaciones que luego puedes lanzar en escritorio o dispositivos móviles, así como en la web.[/fill]"]
	)
	bubble_add_video(GODOT_SHOWCASE)
	complete_step()

func pronunciation() -> void:
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_avatar_dialog(DIALOGO_2)
	bubble_set_title("¿Como se pronuncia?")
	bubble_add_text(
		["[fill]El como pronuncies Godot realmente no importa.[/fill]",
		"[fill]Pero si te interesa su nombre proviene de la obra [b]Waiting for Godot[/b].[/fill]"]
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
			["[wave amp=50.0 freq=5.0 connected=1][b]¡Felicidades, has completado la lección![/b][/wave]"]
		)
	else:
		bubble_add_text(
			["[b]Gracias por repasar la lección.[/b]"]
		)
	complete_step()
