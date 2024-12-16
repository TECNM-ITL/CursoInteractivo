extends Node

var coches = ["Ford", "Volvo", "BMW", "Toyota"]

func _ready():
	#Agrega un nuevo elemento a la lista
	coches.append("Chevrolet")
	
	#Imprime cada uno de los elementos de la lista
	for coche in coches:
		print(coche)
	
	#Imprime el primer elemento de la lista
	print(coches[0])
	
	#Imprime cada uno de los elementos junto con su posición en la lista
	for i in coches.size():
		print(coches[i] + " ocupa la posición " + str(i))
