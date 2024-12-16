extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const CURRENT_TEST := "prueba_3"
const NEXT_LESSON := "proyecto"
const PRACTICE := "practica_10"

const Evaluacion3 := "res://GDScript/practicas/practica_10.gd"

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
	bubble_set_title("Evaluación 3")
	bubble_add_text(
		["[center]Esta es la evaluación 3.[/center]"]
	)
	complete_step()

func question1() -> void:
	bubble_set_title("Pregunta 1")
	bubble_add_text(["¿Cuál es la salida del siguiente fragmento de código?"])
	bubble_add_code(["for i in range(3):
	print(i)"])
	bubble_add_answer("A) 1 2 3", false)
	bubble_add_answer("B) 0 1 2", true)
	bubble_add_answer("C) 0 1 2 3", false)
	bubble_add_answer("D) 1 2", false)
	complete_step()

func question2() -> void:
	bubble_set_title("Pregunta 2")
	bubble_add_text(["¿Qué estructura de datos es más adecuada para almacenar una colección de elementos en orden y permite duplicados?"])
	bubble_add_answer("A) Diccionario", false)
	bubble_add_answer("B) Conjunto", false)
	bubble_add_answer("C) Lista", true)
	bubble_add_answer("D) Tupla", false)
	complete_step()

func question3() -> void:
	bubble_set_title("Pregunta 3")
	bubble_add_text(["¿Qué tipo de error ocurre cuando intentas acceder a un índice que no existe en una lista?"])
	bubble_add_answer("A) Invalid get key", false)
	bubble_add_answer("B) Invalid get index", true)
	bubble_add_answer("C) Cannot assign a value of type", false)
	bubble_add_answer("D) NameError", false)
	complete_step()

func question4() -> void:
	bubble_set_title("Pregunta 4")
	bubble_add_text(["¿Cuál de los siguientes enunciados describe una advertencia (warning) en lugar de un error en tiempo de ejecución?"])
	bubble_add_answer("A) División entre cero", false)
	bubble_add_answer("B) Variable declarada pero no utilizada", true)
	bubble_add_answer("C) Llamada a una función inexistente", false)
	bubble_add_answer("D) Intento de convertir una cadena a entero cuando no es numérica", false)
	complete_step()

func question5() -> void:
	bubble_set_title("Pregunta 5")
	bubble_add_text(["¿Qué tipo de ciclo deberías usar si no sabes cuántas iteraciones necesitas hacer?"])
	bubble_add_answer("A) For", false)
	bubble_add_answer("B) While", true)
	bubble_add_answer("C) Do-While", false)
	bubble_add_answer("D) Switch", false)
	complete_step()

func question6() -> void:
	bubble_set_title("Pregunta 6")
	bubble_add_text(["¿Qué método se utiliza para agregar un elemento al final de una lista?"])
	bubble_add_answer("A) append()", true)
	bubble_add_answer("B) add()", false)
	bubble_add_answer("C) insert()", false)
	bubble_add_answer("D) extend()", false)
	complete_step()

func question7() -> void:
	bubble_set_title("Pregunta 7")
	bubble_add_text(["¿Cuál es el error en el siguiente código si la variable x es una lista vacía?"])
	bubble_add_code(["x = []\nprint(x[0])"])
	bubble_add_answer("A) Invalid get index '0' (on base 'Dictionary').", false)
	bubble_add_answer("B) Invalid get index '2' (on base 'Array').", false)
	bubble_add_answer("C) Invalid get index '0' (on base 'Array').", true)
	bubble_add_answer("D) Index p_index = 0 is out of bounds.", false)
	complete_step()

func question8() -> void:
	bubble_set_title("Pregunta 8")
	bubble_add_text(["¿Qué sucede si un ciclo while no tiene una condición que eventualmente se vuelva falsa?"])
	bubble_add_answer("A) El ciclo se ejecuta una vez y termina", false)
	bubble_add_answer("B) El programa lanza un error", false)
	bubble_add_answer("C) El ciclo se ejecuta indefinidamente", true)
	bubble_add_answer("D) El programa se detiene automáticamente después de 10 iteraciones", false)
	complete_step()

func question9() -> void:
	bubble_set_title("Pregunta 9")
	bubble_add_text(["¿Como puedes omitir una advertencia?"])
	bubble_add_answer("A) @warning_ignore", true)
	bubble_add_answer("B) #warning_ignore", false)
	bubble_add_answer('C) warnings.catch_warnings(action="ignore")', false)
	bubble_add_answer("D) No se puede", false)
	complete_step()

func question10() -> void:
	bubble_set_title("Pregunta 10")
	bubble_add_text(["¿Qué se imprimirá en pantalla con el siguiente código?"])
	bubble_add_code(["lista = [10, 20, 30, 40]
for i in range(lista.size()):
	if i == 2:
		break
	print(lista[i])"])
	bubble_add_answer("A) 10", false)
	bubble_add_answer("B) 10 20", true)
	bubble_add_answer("C) 10 20 30", false)
	bubble_add_answer("D) 10 20 30 40", false)
	complete_step()

func question11() -> void:
	bubble_set_title("Pregunta 11")
	bubble_add_text(["¿Qué sucede si intentas dividir un número entre cero?"])
	bubble_add_answer("A) No pasa nada", false)
	bubble_add_answer("B) Da un error Division by zero error in operator '/'", true)
	bubble_add_answer("C) Da un error ZeroDivisionError", false)
	bubble_add_answer("D) Explota la computadora", false)
	complete_step()

func question12() -> void:
	bubble_set_title("Pregunta 12")
	bubble_add_text(["¿Cuál es la salida del siguiente código?"])
	bubble_add_code(["x = [1, 2, 3]
x.insert(1, 10)
print(x)"])
	bubble_add_answer("A) [10, 1, 2, 3]", false)
	bubble_add_answer("B) [1, 2, 3, 10]", false)
	bubble_add_answer("C) [1, 2, 10, 3]", false)
	bubble_add_answer("D) [1, 10, 2, 3]", true)
	complete_step()

func question13() -> void:
	bubble_set_title("Pregunta 13")
	bubble_add_text(["¿Cuál de los siguientes enunciados describe correctamente un for?"])
	bubble_add_answer("A) Un ciclo for siempre debe tener una lista de números como rango", false)
	bubble_add_answer("B) Un ciclo for puede iterar sobre cualquier objeto iterable", true)
	bubble_add_answer("C) Un ciclo for siempre requiere un índice de control", false)
	bubble_add_answer("D) Un ciclo for solo se utiliza para iterar sobre listas", false)
	complete_step()

func question14() -> void:
	bubble_set_title("Pregunta 14")
	bubble_add_text(["¿Cómo puedes evitar un ciclo infinito en un ciclo while?"])
	bubble_add_answer("A) Usar siempre una lista en la condición", false)
	bubble_add_answer("B) Usar break siempre al final del ciclo", false)
	bubble_add_answer("C) Limitar el número de iteraciones a un máximo de 10", false)
	bubble_add_answer("D) Asegurarte de que la condición del ciclo cambie dentro del cuerpo del ciclo", true)
	complete_step()

func question15() -> void:
	bubble_set_title("Pregunta 15")
	bubble_add_text(["¿Las advertencias son errores?"])
	bubble_add_answer("A) Sí, ya que ", true)
	bubble_add_answer("B) No, ya que", false)
	complete_step()

func exercise() -> void:
	context_set_script()
	scene_open("res://GDScript/practicas/practica_10.tscn")
	highlight_controls([interface.script_editor, interface.run_bar_play_current_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_title("Evaluación 3")
	bubble_add_text(["[fill]Crear un programa que almacene en un array calificaciones, y luego calcular el promedio de esas calificaciones.[/fill]"])
	bubble_add_task(
		"Crea un array para almacenar esas calificaciones.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion3).source_code.replace(" ", "")
			if source_code.contains("varcalificaciones=["):
				return 1
			return 0
	)
	bubble_add_task(
		"Calcula la suma total de las calificaciones utilizando un bucle for.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion3).source_code.replace(" ", "")
			if source_code.contains("for") && source_code.contains("+") && source_code.contains("="):
				return 1
			return 0
	)
	bubble_add_task(
		"Calcula y muestra el promedio de las calificaciones.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion3).source_code.replace(" ", "")
			if source_code.contains("/") && source_code.contains("print("):
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
					regex.compile(r"\d")
					if regex.search(logger[1]):
						bubble.code = load(Evaluacion3).source_code
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
