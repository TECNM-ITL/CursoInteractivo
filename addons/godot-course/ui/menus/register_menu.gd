@tool
extends CanvasLayer

const SALUDO = preload("res://addons/godot-course/bubble/godette/audios/Saludo.mp3")
const FORMULARIO = preload("res://addons/godot-course/bubble/godette/audios/Formulario.mp3")
const DIALOG = preload("res://addons/godot-course/ui/dialog/dialog.tscn")

@onready var lb_message := %Lb_message
@onready var bt_ok := %Bt_ok
@onready var input_name := %Input_name
@onready var input_email := %Input_email
@onready var input_password := %Input_password
@onready var check_password := %check_password
@onready var input_lastname := %Input_lastname
@onready var input_n_control := %Input_n_control
@onready var age := $Panel/PanelContainer/MarginContainer/VBoxContainer/Age
@onready var gender := $Panel/PanelContainer/MarginContainer/VBoxContainer/Gender
@onready var spin_age := %Spin_age
@onready var check_gender := %Check_gender
@onready var sd_click := %sd_click
@onready var godette := %Godette

func setup() -> void:
	if !Manager.user_exists():
		godette.play_dialog(SALUDO)
	else:
		Manager.load_user()
		if Manager.data["email"].is_empty():
			lb_message.text = "Tu conexión se ha recuperado.\nAhora puedes ingresar tu correo y contraseña."
			show_email()
	
	bt_ok.pressed.connect(func emit_register() -> void:
		sd_click.play()
		await sd_click.finished
		if input_name.visible:
			validate_name()
		elif input_email.visible:
			validate_account()
	)
	
	check_password.toggled.connect(func show_password(toggled : bool) -> void:
		input_password.secret = !toggled
	)

func _input(event : InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE:
			queue_free()

func show_email() -> void:
	input_name.hide()
	input_email.show()
	input_password.show()
	check_password.show()
	input_lastname.show()
	input_n_control.show()
	age.show()
	gender.show()

func validate_name() -> void:
	if input_name.text.is_empty(): return
	
	Manager.data.nombre = input_name.text.replace(" ", "")
	
	godette.play_dialog(FORMULARIO)
	lb_message.text = "¡Gusto en conocerte " + Manager.data.nombre + "!"
	if Manager.connected:
		show_email()
		lb_message.text += "\nPor favor llena el siguiente formulario."
	else:
		lb_message.text = "Tu progreso sera guardado localmente."
		Manager.save_user()
		Manager.load_user()
		bt_ok.disabled = true
		await get_tree().create_timer(2.0).timeout
		exit()

func validate_account() -> void:
	var datetime := Time.get_datetime_string_from_system(false, true).split(" ")
	
	if input_email.text.is_empty() || input_password.text.is_empty() || input_lastname.text.is_empty() || input_n_control.text.is_empty():
		lb_message.text = "Debes llenar todos los datos."
		return
	
	Manager.data.email = input_email.text
	Manager.data.password = input_password.text
	Manager.data.apellidos = input_lastname.text
	Manager.data.n_control = input_n_control.text.replace(" ", "")
	Manager.data.edad = spin_age.value
	Manager.data.sexo = "F" if check_gender.button_pressed else "M"
	Manager.data.fecha_registro = datetime[0]
	Manager.data.tiempo_registro = datetime[1]
	Manager.data.sesion = true
	Manager.save_user()
	
	Manager.run(["register_user", Manager.data.email, Manager.data.password])
	var message := Manager.output
	lb_message.text = message
	if message.contains("Tu progreso sera guardado localmente."):
		Manager.data.email = ""
		Manager.data.password = ""
		Manager.data.apellidos = ""
		Manager.data.n_control = ""
		Manager.data.edad = 0
		Manager.data.sexo = ""
		Manager.data.fecha_registro = ""
		Manager.data.tiempo_registro = ""
		Manager.data.sesion = false
		Manager.save_user()
		Manager.load_user()
	elif message.contains("El usuario ya existe.") || message.contains("La contraseña debe tener mínimo 6 caracteres.") || message.contains("El correo electrónico tiene un formato inválido."): return
	bt_ok.disabled = true
	await get_tree().create_timer(2.0).timeout
	if message.contains("Usuario registrado exitosamente."):
		var message_d = DIALOG.instantiate()
		EditorInterface.get_base_control().add_child(message_d)
		message_d.setup("Se ha enviado un mensaje de verificación a tu correo, por favor confirmalo.", 0, HORIZONTAL_ALIGNMENT_CENTER)
	exit()

func exit() -> void:
	CourseMenu.show_menu()
	queue_free()

func _on_check_gender_toggled(toggled_on):
	if toggled_on:
		check_gender.text = "Femenino"
	else:
		check_gender.text = "Masculino"
