extends "res://addons/godot-course/lesson.gd"

const START_BACKGROUND := preload("res://addons/godot-course/bubble/start_background.tres")
const FINISH_BACKGROUND := preload("res://addons/godot-course/bubble/finish_background.tres")

const CURRENT_TEST := "prueba_2"
const NEXT_LESSON := "ciclos"
const PRACTICE := "practica_9"

const Evaluacion2 := "res://GDScript//practicas/practica_9.gd"

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
	bubble_set_title("Evaluación 2")
	bubble_add_text(
		["[center]Esta es la evaluación 2.[/center]"]
	)
	complete_step()

func question1() -> void:
	bubble_set_title("Pregunta 1")
	bubble_add_text(["¿Qué es una función en programación?"])
	bubble_add_answer("A) Una estructura de datos que almacena valores.", false)
	bubble_add_answer("B) Un conjunto de instrucciones agrupadas \npara realizar una tarea específica.", true)
	bubble_add_answer("C) Una palabra clave que define una variable.", false)
	bubble_add_answer("D) Un operador que compara dos valores.", false)
	complete_step()

func question2() -> void:
	bubble_set_title("Pregunta 2")
	bubble_add_text(["¿Qué operador se utiliza para asignar un valor a una variable?"])
	bubble_add_answer("A) equals", false)
	bubble_add_answer("B) +=", false)
	bubble_add_answer("C) =", true)
	bubble_add_answer("D) !=", false)
	complete_step()

func question3() -> void:
	bubble_set_title("Pregunta 3")
	bubble_add_text(["¿Cuál es el propósito de un condicional en programación?"])
	bubble_add_answer("A) Ejecutar un bloque de código repetidamente.", false)
	bubble_add_answer("B) Evaluar una condición y ejecutar un bloque \nde código si la condición es verdadera.", true)
	bubble_add_answer("C) Almacenar múltiples valores.", false)
	bubble_add_answer("D) Combinar dos cadenas de texto.", false)
	complete_step()

func question4() -> void:
	bubble_set_title("Pregunta 4")
	bubble_add_text(["¿Qué operador se utiliza para verificar si dos valores son iguales?"])
	bubble_add_answer("A) =", false)
	bubble_add_answer("B) >=", false)
	bubble_add_answer("C) not equals", false)
	bubble_add_answer("D) ==", true)
	complete_step()

func question5() -> void:
	bubble_set_title("Pregunta 5")
	bubble_add_text(["¿Cuál de las siguientes sentencias condicionales es válida en GDScript?"])
	bubble_add_answer("A) if x > 10: ...", true)
	bubble_add_answer("B) if x == 10 { ... }", false)
	bubble_add_answer("C) if (x equals 10) { ... }", false)
	bubble_add_answer("D) if x = 10 then { ... }", false)
	complete_step()

func question6() -> void:
	bubble_set_title("Pregunta 6")
	bubble_add_text(["¿Qué operador lógico devuelve verdadero si ambas condiciones son verdaderas?"])
	bubble_add_answer("A) &&", true)
	bubble_add_answer("B) :", false)
	bubble_add_answer("C) not", false)
	bubble_add_answer("D) ?", false)
	complete_step()

func question7() -> void:
	bubble_set_title("Pregunta 7")
	bubble_add_text(["¿Cuál es el resultado de la expresión 5 > 3 && 2 == 2?"])
	bubble_add_answer("A) Falso", false)
	bubble_add_answer("B) Error de sintaxis", false)
	bubble_add_answer("C) Verdadero", true)
	bubble_add_answer("D) No se puede evaluar", false)
	complete_step()

func question8() -> void:
	bubble_set_title("Pregunta 8")
	bubble_add_text(["¿Qué palabra clave se utiliza para devolver un valor desde una función?"])
	bubble_add_answer("A) await", false)
	bubble_add_answer("B) return", true)
	bubble_add_answer("C) output", false)
	bubble_add_answer("D) break", false)
	complete_step()

func question9() -> void:
	bubble_set_title("Pregunta 9")
	bubble_add_text(["¿Qué operador se usa para negar una condición?"])
	bubble_add_answer("A) and", false)
	bubble_add_answer("B) or", false)
	bubble_add_answer("C) !", true)
	bubble_add_answer("D) <", false)
	complete_step()

func question10() -> void:
	bubble_set_title("Pregunta 10")
	bubble_add_text(["Si tienes una función f(x) que devuelve el valor de x * 2, ¿cuál es el resultado de f(5)?"])
	bubble_add_answer("A) 5", false)
	bubble_add_answer("B) 15", false)
	bubble_add_answer("C) 10", true)
	bubble_add_answer("D) 25", false)
	complete_step()

func question11() -> void:
	bubble_set_title("Pregunta 11")
	bubble_add_text(["¿Qué es un parámetro en una función?"])
	bubble_add_answer("A) Una variable que se utiliza solo dentro de condicionales.", false)
	bubble_add_answer("B) Una variable que se pasa a la función cuando se llama.", true)
	bubble_add_answer("C) Una operación matemática utilizada dentro de la función.", false)
	bubble_add_answer("D) Un valor devuelto por la función.", false)
	complete_step()

func question12() -> void:
	bubble_set_title("Pregunta 12")
	bubble_add_text(["¿Qué operador se usa para comparar si un valor es diferente de otro?"])
	bubble_add_answer("A) ;", false)
	bubble_add_answer("B) !=", true)
	bubble_add_answer("C) <=", false)
	bubble_add_answer("D) >", false)
	complete_step()

func question13() -> void:
	bubble_set_title("Pregunta 13")
	bubble_add_text(["¿Cuál es la salida de la siguiente expresión condicional: [b]if 5 < 10[/b]?"])
	bubble_add_answer("A) Se ejecuta el bloque de código porque la condición es verdadera.", true)
	bubble_add_answer("B) No se ejecuta el bloque de código porque la condición es falsa.", false)
	bubble_add_answer("C) Depende del tipo de dato de las variables.", false)
	bubble_add_answer("D) No se puede determinar sin más información.", false)
	complete_step()

func question14() -> void:
	bubble_set_title("Pregunta 15")
	bubble_add_text(["¿Cuál es el resultado de la siguiente operación?"])
	bubble_add_code(["var a = 13.5\nvar b = 1.5\nvar c = a + b * a / b"])
	bubble_add_answer("A) 135", false)
	bubble_add_answer("B) 27", true)
	bubble_add_answer("C) 202.5", false)
	bubble_add_answer("D) 15", false)
	complete_step()

func question15() -> void:
	bubble_set_title("Pregunta 15")
	bubble_add_text(["¿Qué operador se usa para combinar múltiples condiciones y devolver verdadero si al menos una es verdadera?"])
	bubble_add_answer("A) $", false)
	bubble_add_answer("B) ||", true)
	bubble_add_answer("C) *", false)
	bubble_add_answer("D) %", false)
	complete_step()

func exercise() -> void:
	context_set_script()
	scene_open("res://GDScript/practicas/practica_9.tscn")
	highlight_controls([interface.script_editor, interface.run_bar_play_current_button])
	bubble_move_and_anchor(interface.base_control, Bubble.At.BOTTOM_RIGHT)
	bubble_set_title("Evaluación 2")
	bubble_add_text(["[fill]Escribe una función que se llame [b]factorial[/b] donde reciba como parametro [b]n[/b] y que calcule y retorne el factorial de un número dado.[/fill]"])
	bubble_add_task(
		"Crea la función.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion2).source_code.replace(" ", "")
			source_code = source_code.to_lower()
			source_code = source_code.replace(".0", "")
			if source_code.contains("ifn<0:") && source_code.contains("ifn<=1:") && source_code.contains("else:"):
				if source_code.contains("returnnull") && source_code.contains("return1") && source_code.contains("returnn*factorial(n-1)"):
					return 1
			return 0
	)
	bubble_add_task(
		"Imprime el resultado.",
		false,
		1,
		func(task : Task) -> int:
			var source_code : String = load(Evaluacion2).source_code.replace(" ", "")
			if source_code.contains("print(factorial("):
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
						bubble.code = load(Evaluacion2).source_code
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
