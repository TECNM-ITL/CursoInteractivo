@tool
extends CanvasLayer

const LOGIN := preload("res://addons/godot-course/bubble/godette/audios/Login.mp3")

@onready var input_email := %Input_email
@onready var input_password := %Input_password
@onready var check_password := %check_password
@onready var bt_ok := %Bt_ok
@onready var sd_click := %sd_click
@onready var sd_close := $sd_close
@onready var lb_message := %Lb_message
@onready var bt_close := %Bt_close
@onready var godette := %Godette

func setup() -> void:
	godette.play_dialog(LOGIN)
	
	bt_ok.pressed.connect(func login() -> void:
		sd_click.play()
		await sd_click.finished
		Manager.data.email = input_email.text
		Manager.data.password = input_password.text
		login()
	)
	
	bt_close.pressed.connect(func back() -> void:
		sd_close.play()
		await  sd_close.finished
		queue_free()
	)
	
	check_password.toggled.connect(func show_password(toggled : bool) -> void:
		input_password.secret = !toggled
	)

func _input(event : InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_ESCAPE:
			queue_free()

func load_practices() -> void:
	const PATH := "res://GDScript/practicas/"
	for practice in Manager.data["practicas"]:
		var code : String = Manager.data["practicas"][practice]["codigo"]
		if !code.is_empty():
			var script := FileAccess.open(PATH + practice + ".gd", FileAccess.WRITE)
			script.store_string(code)
			script.close()

func login() -> void:
	if input_email.text.is_empty() && input_password.text.is_empty(): return
	
	Manager.run(["login_user", Manager.data.email, Manager.data.password])
	var message := Manager.output
	lb_message.text = message
	if message == "Inicio de sesión exitoso.":
		bt_ok.disabled = true
		bt_close.disabled = true
		await get_tree().create_timer(2.0).timeout
		Manager.load_user()
		load_practices()
		CourseMenu.show_menu()
		queue_free()
