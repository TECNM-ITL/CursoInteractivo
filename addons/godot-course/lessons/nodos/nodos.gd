extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES := preload("res://addons/godot-course/lessons/nodos/nodos.tres")

const CURRENT_LESSON := "nodos"
const NEXT_LESSON := "hola_gdscript"

const TREE := preload("res://addons/godot-course/lessons/nodos/videos/tree.ogv")
const NODES_TREE := preload("res://addons/godot-course/lessons/nodos/videos/nodes_tree.ogv")
const NODES_AND_SCENES_CHARACTER_NODES := preload("res://addons/godot-course/lessons/nodos/imagenes/nodes_and_scenes_character_nodes.png")
const NODES_AND_SCENES_3D_SCENE_EXAMPLE := preload("res://addons/godot-course/lessons/nodos/imagenes/nodes_and_scenes_3d_scene_example.png")

func _build() -> void:
	init()
	intro()
	what_are_nodes()
	characteristics()
	scenes()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(2)

func intro() -> void:
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("La escena principal del juego.")
	bubble_add_text(
		["[center]En esta lección aprenderás acerca de los nodos en Godot.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func what_are_nodes() -> void:
	bubble_set_title("¿Qué son los nodos?")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	bubble_add_text(
		["[fill]Los nodos en Godot son un conjunto de objetos con un propósito en específico, estos son parte de un árbol y siempre heredan características de sus padres partiendo desde la raíz [b]Node[/b].",
		"[fill]Si bien el motor presenta algunos nodos como formas de colisión que depende de otros nodos de físicas, la mayoría de los nodos funcionan independientemente unos de otros.[/fill]"]
	)
	bubble_add_video(TREE)
	complete_step()
	
	bubble_set_title("¿Qué son los nodos?")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
	bubble_add_text(
		["Godot ofrece una amplia biblioteca de tipos de nodos base que puedes combinar y ampliar para crear otros más potentes. 2D, 3D o interfaz de usuario, harás la mayoría de las cosas con estos nodos."]
	)
	bubble_add_video(NODES_TREE)
	complete_step()

func characteristics() -> void:
	bubble_set_title("Características")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	bubble_add_text(
		["Todos los nodos tienen las siguientes características:",
		"[ul]Un nombre.[/ul]",
		"[ul]Propiedades editables.[/ul]",
		"[ul]Reciben llamadas de vuelta para actualizar cada cuadro.[/ul]",
		"[ul]Puedes ampliarlos con nuevas propiedades y funciones.[/ul]",
		"[ul]Puedes agregarlos a otro nodo como hijo.[/ul]"]
	)
	complete_step()
	
	bubble_set_title("Características")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	bubble_add_text(
		["[fill]La última característica es importante. Juntos, los nodos forman un árbol, lo que es una característica poderosa para organizar proyectos. Dado que los diferentes nodos tienen diferentes funciones, combinarlos produce un comportamiento más complejo. En la siguiente ilustración muestra un ejemplo de un árbol para formar un personaje jugable.[/fill]"]
	)
	bubble_add_texture(NODES_AND_SCENES_CHARACTER_NODES)
	complete_step()

func scenes() -> void:
	bubble_set_title("Escenas")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	bubble_add_text(
		["[fill]Una escena es una colección de nodos y código estructurados como quieras en un árbol jerárquico que representa una parte funcional de un juego o aplicación. Puedes componer nodos para crear tipos de nodos personalizados y complejos, como un personaje de juego que corre y salta, una barra de vida, un cofre con el que puedes interactuar y más.[/fill]"]
	)
	bubble_add_texture(NODES_AND_SCENES_3D_SCENE_EXAMPLE)
	complete_step()
	
	bubble_set_title("Escenas")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_add_text(
		["[fill]Cada escena en Godot puede ser guardada en su propio archivo (.tscn o .scn), lo que facilita la organización y reutilización. Además, las escenas pueden instanciarse dentro de otras escenas, permitiendo la creación de estructuras complejas a partir de piezas más simples.[/fill]"]
	)
	bubble_add_texture(NODES_AND_SCENES_3D_SCENE_EXAMPLE)
	
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
