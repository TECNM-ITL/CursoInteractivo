extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const CURRENT_TEST := "prueba_1"
const NEXT_LESSON := "funciones"
const PRACTICE := "practica_8"

const Evaluacion1 := "res://GDScript/practicas/practica_8.gd"

func _build() -> void:
	intro()
	question1()
	question2()
	question3()
	question4()
	question5()
	question6()
	question7()
	question8()
	question9()
	question10()
	question11()
	question12()
	question13()
	question14()
	question15()
	exercise()
	complete_test()

func intro() -> void:
	bubble_hide_avatar()
	bubble_set_current_item(CURRENT_TEST)
	bubble_set_next_item(NEXT_LESSON)
	bubble_set_practice(PRACTICE)
	bubble_set_progress_value(6)
	bubble_active_evaluation_mode(true)
	context_set_2d()
	bubble_set_background(START_BACKGROUND)
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Evaluación 1")
	bubble_add_text(
		["[center]Esta es la evaluación 1.[/center]"]
	)
	complete_step()

func question1() -> void:
	bubble_set_title("Pregunta 1")
	bubble_add_text(["¿Qué es GDScript?"])
	bubble_add_answer("A) Un lenguaje ensamblador.", false)
	bubble_add_answer("B) Un lenguaje de programación utilizado en Godot.", true)
	bubble_add_answer("C) Un lenguaje de marcado utilizado para \nla creación de páginas web.", false)
	bubble_add_answer("D) Lenguaje alienígena.", false)
	complete_step()

func question2() -> void:
	bubble_set_title("Pregunta 2")
	bubble_add_text(["¿Cómo le das instrucciones a una computadora?"])
	bubble_add_answer("A) Hablandole bonito.", false)
	bubble_add_answer("B) A través de señales de humo.", false)
	bubble_add_answer("C) Utilizando un lenguaje de programación \ne instrucciones precisas.", true)
	bubble_add_answer("D) Mediante gestos de la mano.", false)
	complete_step()

func question3() -> void:
	bubble_set_title("Pregunta 3")
	bubble_add_text(["¿Cuál es la extensión de archivo de los scripts de GDScript?"])
	bubble_add_answer("A) .gd", true)
	bubble_add_answer("B) .gds", false)
	bubble_add_answer("C) .py", false)
	bubble_add_answer("D) .gdscript", false)
	complete_step()

func question4() -> void:
	bubble_set_title("Pregunta 4")
	bubble_add_text(["¿Qué es una variable?"])
	bubble_add_answer("A) Un tipo de archivo que almacena datos permanentemente.", false)
	bubble_add_answer("B) Un componente de hardware que mejora \nel rendimiento del ordenador.", false)
	bubble_add_answer("C) Un id que le asignas a una variable.", false)
	bubble_add_answer("D) Contenedor donde se almacenan distintos tipos de datos \ny estos pueden cambiar.", true)
	complete_step()

func question5() -> void:
	bubble_set_title("Pregunta 5")
	bubble_add_text(["¿Cómo se declara una variable en GDScript?"])
	bubble_add_answer("A) int x", false)
	bubble_add_answer("B) var x", true)
	bubble_add_answer("C) let x", false)
	bubble_add_answer("D) x", false)
	complete_step()

func question6() -> void:
	bubble_set_title("Pregunta 6")
	bubble_add_text(["¿Cuál es la función principal que se ejecuta cuando se inicia un script?"])
	bubble_add_answer("A) _init()", false)
	bubble_add_answer("B) _ready()", true)
	bubble_add_answer("C) _start()", false)
	bubble_add_answer("D) _begin()", false)
	complete_step()

func question7() -> void:
	bubble_set_title("Pregunta 7")
	bubble_add_text(["¿Son todos los lenguajes de programación completamente diferentes?"])
	bubble_add_answer("A) No, tienen muchas similitudes.", true)
	bubble_add_answer("B) Sí, son completamente diferentes.", false)
	complete_step()

func question8() -> void:
	bubble_set_title("Pregunta 8")
	bubble_add_text(["¿Qué es un String?"])
	bubble_add_answer("A) Un mensaje.", false)
	bubble_add_answer("B) Un texto.", false)
	bubble_add_answer("C) Letras.", false)
	bubble_add_answer("D) Cadena de caracteres.", true)
	complete_step()

func question9() -> void:
	bubble_set_title("Pregunta 9")
	bubble_add_text(["GDScript es un lenguaje...."])
	bubble_add_answer("A) Estático", false)
	bubble_add_answer("B) Dinámico", true)
	bubble_add_answer("C) Compilado", false)
	bubble_add_answer("D) Las tres anteriores", false)
	complete_step()

func question10() -> void:
	bubble_set_title("Pregunta 10")
	bubble_add_text(["¿Qué es una constante?"])
	bubble_add_answer("A) Un valor que no cambia durante \nla ejecución de un programa.", true)
	bubble_add_answer("B) Un tipo de variable que puede modificar su valor.", false)
	bubble_add_answer("C) Un tipo de dato.", false)
	bubble_add_answer("D) Un valor numérico.", false)
	complete_step()

func question11() -> void:
	bubble_set_title("Pregunta 11")
	bubble_add_text(["¿Para que son utiles los booleanos?"])
	bubble_add_answer("A) Para hacer operaciones aritmeticas.", false)
	bubble_add_answer("B) Para hacer condicionales.", true)
	bubble_add_answer("C) Para escribir texto", false)
	bubble_add_answer("D) Para concatenar.", false)
	complete_step()

func question12() -> void:
	bubble_set_title("Pregunta 12")
	bubble_add_text(["¿Cuál no es un nombre apropiado para una variable?"])
	bubble_add_answer("A) nombre_apellidos", false)
	bubble_add_answer("B) numero1", false)
	bubble_add_answer("C) 45_grados", true)
	bubble_add_answer("D) articuloNuevo", false)
	complete_step()

func question13() -> void:
	bubble_set_title("Pregunta 13")
	bubble_add_text(["¿Qué hace el siguiente metodo?"])
	bubble_add_code(["print()"])
	bubble_add_answer("A) Imprime valores en la salida o consola.", true)
	bubble_add_answer("B) Retorna un mensaje.", false)
	bubble_add_answer("C) No existe esa función.", false)
	bubble_add_answer("D) Imprime un error.", false)
	complete_step()

func question14() -> void:
	bubble_set_title("Pregunta 14")
	bubble_add_text(["¿Cómo se declara apropiadamente una constante en GDScript?"])
	bubble_add_answer("A) const valor = 10", false)
	bubble_add_answer("B) const valor", false)
	bubble_add_answer("C) const VALOR = 10", true)
	bubble_add_answer("D) var valor = 10", false)
	complete_step()

func question15() -> void:
	bubble_set_title("Pregunta 15")
	bubble_add_text(["¿Qué similitudes comparte GDScript con otros lenguajes?"])
	bubble_add_answer("A) Utiliza el sistema binario para todas sus operaciones.", false)
	bubble_add_answer("B) Solo se puede usar en dispositivos móviles.", false)
	bubble_add_answer("C) Tiene estructuras y sintaxis similares a Python.", true)
	bubble_add_answer("D) No permite la programación orientada a objetos.", false)
	complete_step()

func exercise() -> void:
	context_set_script()
	scene_open("res://GDScript/practicas/practica_8.tscn")
	highlight_controls([interface.script_editor, interface.run_bar_play_current_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_title("Evaluación 1")
	bubble_add_text(["Declara las siguientes variables para almacenar la información correspondiente sobre un estudiante.
	- Nombre
	- Apellidos
	- Edad
	- Carrera"])
	bubble_add_task(
		"Declara las variables e imprimelas.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion1).source_code.replace(" ", "")
			source_code = source_code.to_lower()
			if source_code.contains("varnombre=") && source_code.contains("varapellidos=") && source_code.contains("varedad=") && source_code.contains("varcarrera="):
				if source_code.contains("print(nombre)") && source_code.contains("print(apellidos)") && source_code.contains("print(edad)") && source_code.contains("print(carrera)"):
					return 1
			return 0
	)
	bubble_add_task(
		"Ejecuta el código.",
		true,
		1,
		func(task : Task) -> int:
			var index : int = interface.script_editor_items.get_selected_items()[0]
			var script_editors := interface.script_editor.get_open_script_editors()
			var total_errors := int(script_editors[index].get_child(0).get_child(0).get_child(1).get_child(2).text)
			var logger := interface.logger_text.get_parsed_text().c_unescape().split("\n ")
			if EditorInterface.is_playing_scene() && total_errors == 0:
				if !interface.logger_text.get_parsed_text().is_empty():
					var regex := RegEx.new()
					regex.compile(r"[a-zA-Z0-9]")
					if regex.search(logger[1]):
						bubble.code = load(Evaluacion1).source_code
						return 1
			return 0
	)
	complete_step()
	
	queue_command(func ouput_open():
		interface.bottom_button_output.button_pressed = false
	)

func complete_test() -> void:
	context_set_2d()
	bubble_set_background(FINISH_BACKGROUND)
	bubble_move_and_anchor(interface.base_control, Bubble.At.CENTER)
	bubble_set_avatar_at(Bubble.AvatarAt.CENTER)
	bubble_set_title("Evaluación completada")
	bubble_add_text(
		["[b]¡Felicidades, has completado la evaluación![b]",
		"[b]Puedes ver tu calificación en el menú de evaluaciones.[b]"]
	)
	complete_step()
