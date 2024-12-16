extends Node

var valor = 0

func _ready():
	ciclo_for()
	ciclo_while()

func ciclo_for():
	for i in range(1, 5):
		valor = i
		print("Ciclo for: " + str(valor))

func ciclo_while():
	while(valor >= 1):
		print("Ciclo while: " + str(valor))
		valor -= 1
