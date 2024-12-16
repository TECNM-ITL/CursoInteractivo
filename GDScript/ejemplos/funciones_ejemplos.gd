extends Node

func _ready():
	mensaje()
	numero_caracteres("Hola mundo")
	print("Suma: " + str(suma(5, 5)))

func mensaje():
	var texto = "Uno Dos Tres Cuatro"
	var palabras = texto.split(" ")
	print(texto[0])
	print(texto[1])
	print(texto[2])
	print(texto[3])

func numero_caracteres(texto):
	print(len(texto))

func suma(a, b):
	return a + b + suma(a, b)
