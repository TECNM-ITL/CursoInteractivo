extends "res://addons/godot-course/lesson.gd"

const ICONS_MAP := {
	script = "res://addons/godot-course/ui/icons/script.svg"
}

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const DIALOGUES = preload("res://addons/godot-course/lessons/programando_jugador/programando_jugador.tres")

const CURRENT_LESSON := "programar_jugador"
const NEXT_LESSON := "creando_enemigo"

var script_player = "res://DodgeTheCreeps/jugador.gd"

func _build() -> void:
	init()
	intro()
	create_script()
	coding()
	new_property()
	on_ready()
	new_code()
	connect_signal()
	signal_body()
	save_scene()
	complete_lesson()

func init() -> void:
	bubble_set_current_item(CURRENT_LESSON)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_progress_value(5)

func intro() -> void:
	scene_open("res://DodgeTheCreeps/jugador.tscn")
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[0])
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Jugador")
	bubble_add_text(
		["[center]En esta lección vas a programar al jugador.[/center]",
		"[center]¡Vamos a empezar![/center]"]
	)
	complete_step()

func create_script() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[1])
	highlight_controls([interface.scene_tree])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.TOP_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Primero debes comenzar agregando un script al jugador.",
		"Selecciona al nodo raíz Jugador."]
	)
	bubble_add_task_select_node("Jugador")
	complete_step()
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[2])
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
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[3])
	highlight_controls([interface.script_create_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Este es el menú para la creación de scripts."]
	)
	complete_step()
	
	
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[4])
	highlight_controls([interface.script_create_button_create])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Agregar script")
	bubble_add_text(
		["Ahora presiona el botón crear para confirmar."]
	)
	bubble_add_task_press_button(interface.script_create_button_create, "Presional el botón crear.")
	complete_step()

func coding() -> void:
	context_set_script()
	var code := "signal golpe

@export var acelerar = 400
var tamaño_pantalla
var velocidad"
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[5])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"[fill]Usar la palabra clave [b]export[/b] en la primera velocidad variable nos permite establecer su valor en el Inspector. Esto puede resultar útil para valores que desea poder ajustar como las propiedades integradas de un nodo.[/fill]"
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

func new_property() -> void:
	highlight_inspector_properties(["acelerar"])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[6])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.TOP_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Velocidad")
	bubble_add_text([
		"Con el código que agregaste se agrego una nueva propiedad al jugador."
	])
	complete_step()

func on_ready() -> void:
	var code := "func _ready():
	hide()
	tamaño_pantalla = get_viewport_rect().size"
	context_set_script()
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[7])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Este código oculta el jugador y obtiene el tamaño de la pantalla al inicio del juego."
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()

func new_code() -> void:
	var code := """func inputs():
	if Input.is_action_pressed("ui_right"):
		velocidad.x += 1
	if Input.is_action_pressed("ui_left"):
		velocidad.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocidad.y += 1
	if Input.is_action_pressed("ui_up"):
		velocidad.y -= 1"""
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[8])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"[fill]Verificamos cada entrada y sumamos/restamos la velocidad para obtener una dirección total. Por ejemplo, si mantienes presionado hacia la derecha y hacia abajo al mismo tiempo, el vector de velocidad resultante será (1, 1). En este caso, dado que estamos agregando un movimiento horizontal y vertical, el jugador se movería más rápido en diagonal que si solo se moviera horizontalmente.[/fill]"
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	code = """func normalizar():
	if velocidad.length() > 0:
		velocidad = velocidad.normalized() * acelerar
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()"""
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[9])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"[fill]Podemos evitar eso si normalizamos la velocidad, lo que significa que establecemos su longitud en 1 y luego la multiplicamos por la velocidad deseada. Esto significa que no habrá más movimientos diagonales rápidos.[/fill]"
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	code = """func animaciones():
	if velocidad.x != 0:
		$AnimatedSprite2D.animation = "caminar"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocidad.x < 0
	elif velocidad.y != 0:
		$AnimatedSprite2D.animation = "arriba"
		$AnimatedSprite2D.flip_v = velocidad.y > 0"""
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[10])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		'[fill]Ahora que el jugador puede moverse, necesitamos cambiar qué animación está reproduciendo [b]AnimatedSprite2D[/b] según su dirección. Tenemos la animación "caminar", que muestra al jugador caminando hacia la derecha. Esta animación debe voltearse horizontalmente usando la propiedad [b]flip_h[/b] para movimiento hacia la izquierda. También tenemos la animación "arriba", que debe girarse verticalmente con [b]flip_v[/b] para moverse hacia abajo.[/fill]'
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	code = """func _process(delta):
	velocidad = Vector2.ZERO
	inputs()
	normalizar()
	animaciones()
	position += velocidad * delta
	position = position.clamp(Vector2.ZERO, tamaño_pantalla)"""
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[11])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Comenzamos estableciendo la velocidad en 0; de forma predeterminada, el jugador no debería moverse.",
		"[fill]Ahora que tenemos una dirección de movimiento, podemos actualizar la posición del jugador. También podemos usar [b]clamp()[/b] para evitar que salga de la pantalla. Fijar un valor significa restringirlo a un rango determinado.[/fill]"
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()

func connect_signal() -> void:
	highlight_controls([interface.scene_tree])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[12])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_LEFT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Selecciona al nodo Jugador."
	])
	bubble_add_task_select_node("Jugador")
	complete_step()
	
	highlight_controls([interface.node_tabs])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[13])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Ve al panel Nodo."
	])
	bubble_add_task_set_tab_to_title(interface.node_tabs, "Nodo", "Ve al panel Nodo.")
	complete_step()
	
	highlight_controls([interface.node_dock])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[14])
	bubble_move_and_anchor(interface.script_editor, Bubble.At.CENTER_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.LEFT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Este es el panel con la lista de señales que contiene el nodo."
	])
	complete_step()
	
	highlight_signals(["body_entered(body: Node2D)"])
	highlight_controls([interface.node_dock_connect_button])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[15])
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
	
	highlight_controls([interface.signals_dialog])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[16])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Este es el menú para conectar señales.",
		"Como puedes ver tiene muchas opciones, pero no te preocupes no las usaras para este proyecto."
	])
	complete_step()
	
	highlight_controls([interface.signals_dialog_ok_button])
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[17])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Señales")
	bubble_add_text([
		"Solo presiona el botón señalado para conectar la señal."
	])
	bubble_add_task_press_button(interface.signals_dialog_ok_button, "Presiona el botón conectar.")
	complete_step()

func signal_body() -> void:
	var code := """func _on_body_entered(body):
	hide()
	golpe.emit()
	$CollisionShape2D.set_deferred("disabled", true)"""
	code = code.replace(" ", "")
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[18])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"Cada vez que un enemigo golpea al jugador, se emitirá la señal. Necesitamos desactivar la colisión del jugador para no activar la señal de impacto más de una vez."
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()
	
	code = """func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false"""
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[19])
	highlight_controls([interface.script_editor_code_panel])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_avatar_at(Bubble.AvatarAt.RIGHT)
	bubble_set_title("Programar")
	bubble_add_text([
		"La última pieza es agregar una función a la que podemos llamar para reiniciar el reproductor al iniciar un nuevo juego."
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
			var current_code  : String = base.get_child(0).get_child(0).get_child(0).text.replace(" ", "")
			return 1 if current_code.contains(code) else 0
	)
	complete_step()

func save_scene() -> void:
	bubble_set_avatar_dialog(DIALOGUES.dialogue_audios[20])
	bubble_move_and_anchor(interface.canvas_item_editor, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Guardar escena")
	bubble_add_text([
		"¡Ya esta listo el jugador!",
		"Lo unico que falta es guardar la escena."
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
