@tool
extends CanvasLayer

signal closed

@onready var lb_title1 := $Panel/PanelContainer/Lb_title
@onready var lb_title2 := $Panel/Profile/Lb_title
@onready var bt_edit := %Bt_edit
@onready var sd_start := %sd_start
@onready var sd_close := %sd_close
@onready var bt_close1 := $Panel/PanelContainer/Bt_close
@onready var bt_close2 := $Panel/Profile/Bt_close
@onready var sd_ding := %sd_ding
@onready var panel_container := $Panel/PanelContainer
@onready var profile := $Panel/Profile
@onready var margin_container1 := $Panel/PanelContainer/MarginContainer
@onready var margin_container2 := $Panel/Profile/MarginContainer
@onready var s_general := %S_general
@onready var s_ui := %S_ui
@onready var s_godette := %S_godette
@onready var lb_gen_volume := %Lb_gen_volume
@onready var lb_ui_volume := %Lb_ui_volume
@onready var lb_g_volume := %Lb_g_volume
@onready var input_email := %input_email
@onready var input_password := %input_password
@onready var input_name := %input_name
@onready var input_lastname := %input_lastname
@onready var input_n_control := %input_n_control
@onready var spin_age = %Spin_age
@onready var check_gender := %Check_gender

const ThemeUtils := preload("res://addons/godot-course/ui/theme_utils.gd")
const DIALOG = preload("res://addons/godot-course/ui/dialog/dialog.tscn")

func setup() -> void:
	lb_gen_volume.text = "Volumen General: " + str(snapped(db_to_linear(AudioServer.get_bus_volume_db(0)), 0.01) * 100)
	lb_ui_volume.text = "Volumen UI: " + str(snapped(db_to_linear(AudioServer.get_bus_volume_db(1)), 0.01) * 100)
	lb_g_volume.text = "Volumen Godette: " + str(snapped(db_to_linear(AudioServer.get_bus_volume_db(2)), 0.01) * 100)
	s_general.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	s_ui.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	s_godette.value = db_to_linear(AudioServer.get_bus_volume_db(2))
	bt_edit.disabled = Manager.data["email"].is_empty()
	s_general.connect("value_changed", _on_h_slider_value_changed)
	s_ui.connect("value_changed", _on_h_slider_2_value_changed)
	s_godette.connect("value_changed", _on_h_slider_3_value_changed)
	
	if Engine.is_editor_hint():
		panel_container.custom_minimum_size *= EditorInterface.get_editor_scale()
		bt_close1.custom_minimum_size *= EditorInterface.get_editor_scale()
		bt_close2.custom_minimum_size *= EditorInterface.get_editor_scale()
		for node: Control in [lb_title1, lb_title1]:
			ThemeUtils.scale_font_size(node)
		ThemeUtils.scale_margin_container_margins(margin_container1)
		ThemeUtils.scale_margin_container_margins(margin_container2)

func _on_bt_close_pressed() -> void:
	sd_close.play()
	await sd_close.finished
	closed.emit()
	queue_free()

func _on_h_slider_value_changed(value : float) -> void:
	lb_gen_volume.text = "Volumen General: " + str(value * 100)
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	AudioServer.set_bus_mute(0, value < 0.01)
	sd_ding.play()

func _on_h_slider_2_value_changed(value : float) -> void:
	lb_ui_volume.text = "Volumen UI: " + str(value * 100)
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	AudioServer.set_bus_mute(1, value < 0.01)

func _on_h_slider_3_value_changed(value : float) -> void:
	lb_g_volume.text = "Volumen Godette: " + str(value * 100)
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	AudioServer.set_bus_mute(2, value < 0.01)

func _on_bt_update_pressed():
	Manager.output = ""
	if input_email.text.is_empty() || input_password.text.is_empty() || input_name.text.is_empty() || input_lastname.text.is_empty() || input_n_control.text.is_empty():
		var message = DIALOG.instantiate()
		EditorInterface.get_base_control().add_child(message)
		message.setup("No se permiten campos vacios", 4, HORIZONTAL_ALIGNMENT_CENTER)
		return
	
	if Manager.data.email != input_email.text || Manager.data.password != input_password.text:
		Manager.run(["update_email_password", input_email.text, input_password.text])
	if Manager.output.contains("El nuevo correo ya está en uso.") || Manager.output.contains("La nueva contraseña debe tener mínimo 6 caracteres.") || Manager.output.contains("El correo electrónico debe estar verificado antes de actualizar."):
		var message = DIALOG.instantiate()
		EditorInterface.get_base_control().add_child(message)
		var text = Manager.output.replace("Inicio de sesión exitoso.", "")
		message.setup(text, 0, HORIZONTAL_ALIGNMENT_CENTER)
		return
	Manager.data.email = input_email.text
	Manager.data.password = input_password.text
	Manager.data.nombre = input_name.text
	Manager.data.apellidos = input_lastname.text
	Manager.data.n_control = input_n_control.text
	Manager.data.edad = spin_age.value
	Manager.data.sexo = "F" if check_gender.button_pressed else "M"
	Manager.save_user()
	Manager.run(["update_user"])
	
	var message = DIALOG.instantiate()
	EditorInterface.get_base_control().add_child(message)
	var text = Manager.output.replace("Inicio de sesión exitoso.", "Datos actualizados con exito.")
	message.setup(text, 0, HORIZONTAL_ALIGNMENT_CENTER)

func reset_pratices() -> void:
	const DEFAULT_CODE := "extends Node

func _ready():
	pass
"
	const CODE_4 := "extends  Node

# Asignale un valor numerico a las variables
var numero1
var numero2

func _ready():
	var suma # Realiza una suma de ambas varialbes
	var resta # Realiza una resta de ambas varialbes
	var multiplicacion #Realiza una multiplicación de ambas varialbes
	var division # Realiza una división de ambas varialbes
	
	# Imprime el resultado de cada una de las operacines
"
	
	const CODE_5 := "extends Node

#Asigna un valor numerico
var numero

func _ready():
	pass
"
	
	for practice in Manager.data["practicas"].keys():
		const PATH := "res://GDScript/practicas/"
		var script := FileAccess.open(PATH + practice + ".gd", FileAccess.WRITE)
		if practice == "practica_4":
			script.store_string(CODE_4)
		elif practice == "practica_5":
			script.store_string(CODE_5)
		else:
			script.store_string(DEFAULT_CODE)
		script.close()

func _on_bt_logout_pressed():
	Manager.run(["logout_user"])
	var text = Manager.output
	if !text.contains("No se pudo establecer una conexión."):
		Manager.reset_data()
		reset_pratices()
		profile.hide()
		bt_edit.disabled = true
		panel_container.show()

func _on_bt_edit_pressed():
	panel_container.hide()
	profile.show()
	Manager.load_user()
	
	input_email.text = Manager.data.email
	input_password.text = Manager.data.password
	input_name.text = Manager.data.nombre
	input_lastname.text = Manager.data.apellidos
	input_n_control.text = Manager.data.n_control
	spin_age.value = Manager.data.edad
	check_gender.button_pressed = true if Manager.data.sexo == "F" else false

func _on_check_gender_toggled(toggled_on):
	if toggled_on:
		check_gender.text = "Femenino"
	else:
		check_gender.text = "Masculino"

func _on_check_password_toggled(toggled_on):
	input_password.secret = !toggled_on
