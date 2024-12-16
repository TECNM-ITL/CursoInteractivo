extends  Node

var a = 27.0
var b = 2.0
var c = 0

func _ready():
	c = a + b
	print("Suma: " + str(c))
	c = a - b
	print("Resta: " + str(c))
	c = a * b
	print("Multiplicación: " + str(c))
	c = a / b
	print("División: " + str(c))
	c = 27 % 2
	print("Resto división: " + str(c))
