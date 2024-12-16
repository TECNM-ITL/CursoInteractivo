extends Node

var es_verdadero = false
var valor = 80

# Si es_verdadero es igual a falso
func condicional1():
	if es_verdadero == false:
		print("Es igual a falso")

#Si es_verdadero no es igual a verdadero
func condicional2():
	if es_verdadero != true:
		print("No es igual a verdadero")

#Si valor es mayor de 50
func condicional3():
	if valor > 50:
		print("Si es mayor a 50")

#Si valor es menor de 50
func condicional4():
	if valor < 100:
		print("Si es menor a 100")

#Si valor es mayor o igual a 80
func condicional5():
	if valor >= 80:
		print("Es mayor o igual a 80")

#Si valor es menor o igual a 80
func condicional6():
	if valor <= 80:
		print("Es menor o igual a 80")

#Si valor es igual a 80 y es_verdadero igual a falso
func condicional7():
	if valor == 80 && es_verdadero == false:
		print("Es igual a 80 y es falso")

#Si valor es menor de 100 o es_verdadero igual a verdadero
func condicional8():
	if valor < 100 || es_verdadero == true:
		print("Es menor a 100 o es verdadero")

func condicional9():
	if valor == 80: #Si valor es igual 80
		print("Es igual a 80")
	elif valor > 80: #De lo contrario si valor es mayor de 80
		print("Es mayor a 80")
	else: #De lo contrario es menor de 80
		print("Es menor a 80")
