## Text bubble used to display instructions to the user.
@tool
extends "bubble.gd"

const RichTextLabelPackedScene := preload("rich_text_label/rich_text_label.tscn")
const CodeEditPackedScene := preload("code_edit.tscn")
const TextureRectPackedScene := preload("texture_rect.tscn")
const VideoStreamPlayerPackedScene := preload("video_stream_player.tscn")
const SelectableOption := preload("answer/option.gd")
const HelpPackedScene := preload("res://addons/godot-course/bubble/task/help.tscn")

## Separation between paragraphs of text and elements in the main content in pixels.
@export var paragraph_separation := 12:
	set(new_value):
		paragraph_separation = new_value
		if main_v_box_container == null:
			await ready
		main_v_box_container.add_theme_constant_override("separation", paragraph_separation)

@onready var background := %Background
@onready var title_label: Label = %TitleLabel
@onready var main_v_box_container: VBoxContainer = %MainVBoxContainer
@onready var tasks_v_box_container: VBoxContainer = %TasksVBoxContainer
@onready var help_v_box_container : VBoxContainer = %HelpVBoxContainer
@onready var answers_v_box_container: VBoxContainer = %AnswersVBoxContainer
@onready var step_container: PanelContainer = %StepContainer
@onready var back_button: Button = %BackButton
@onready var next_button: Button = %NextButton
@onready var finish_button: Button = %FinishButton

@onready var view_content: VBoxContainer = %ViewContent
@onready var view_close: VBoxContainer = %ViewClose
@onready var button_minimize:Button = %ButtonMinimize
@onready var button_close: Button = %ButtonClose
@onready var button_close_no: Button = %ButtonCloseNo
@onready var button_close_yes: Button = %ButtonCloseYes

@onready var step_count_label: Label = %StepCountLabel
@onready var sd_finished := %sd_finished
@onready var sd_next := %sd_next
@onready var sd_click := %sd_click
@onready var sd_close := %sd_close
@onready var particles_finish := %particles_finish

var current_item := ""
var next_item := ""
var practice := ""
var progress_value := 0.0
var evaluation_mode := false
var answers : Array[String] = []
var selected_answers : Array[bool] = []
var step := 0
var errors : Array[String]
var code : String

func setup(step_count: int) -> void:
	super(step_count)
	answers.resize(step_count - 2.0)
	selected_answers.resize(step_count - 2.0)
	update_step_count_display(0)

func _ready() -> void:
	super()
	if not Engine.is_editor_hint() or EditorInterface.get_edited_scene_root() == self:
		return
	
	clear_elements()
	
	back_button.pressed.connect(func() -> void:
		sd_next.play()
		back_button_pressed.emit()
	)
	next_button.pressed.connect(func() -> void:
		sd_next.play()
		next_button_pressed.emit()
	)
	button_minimize.pressed.connect(func() -> void:
		main_v_box_container.visible = !main_v_box_container.visible
		step_container.visible = !step_container.visible
		if !evaluation_mode: godette.visible = !godette.visible
		was_moved = false
	)
	button_close.pressed.connect(func() -> void:
		godette.close_dialog()
		sd_close.play()
		view_content.hide()
		view_close.show()
	)
	button_close_no.pressed.connect(func() -> void:
		sd_click.play()
		view_content.show()
		view_close.hide()
	)
	button_close_yes.pressed.connect(func() -> void: 
		sd_click.play()
		await sd_click.finished
		close_requested.emit()
		CourseMenu.show_menu()
	)
	finish_button.pressed.connect(func() -> void:
		sd_click.play()
		close_requested.emit()
		if Manager.user_exists():
			CourseMenu.show_menu()
	)
	#for node in [header_rich_text_label, main_v_box_container, tasks_v_box_container, footer_rich_text_label, footer_spacer]:
		#node.visible = false
	
	var editor_scale := EditorInterface.get_editor_scale()
	button_close.custom_minimum_size *= editor_scale
	paragraph_separation *= editor_scale

#func _process(delta : float) -> void:
	#seconds += delta
	#if seconds >= 60:
		#minutes += 1
		#seconds = 0
	#if minutes >= 60:
		#hours += 1
		#minutes = 0

func on_tour_step_changed(index: int) -> void:
	super(index)
	step = index - 1.0
	
	back_button.visible = true
	finish_button.visible = false
	if index == 0:
		back_button.visible = false
		next_button.visible = tasks_v_box_container.get_children().filter(func(n: Node) -> bool: return not n.is_queued_for_deletion()).size() == 0
		next_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER | Control.SIZE_EXPAND
	elif index == step_count - 1:
		button_close.disabled = true
		button_minimize.disabled = true
		next_button.visible = false
		finish_button.visible = true
		if !evaluation_mode: lesson_completed()
		else: test_completed()
	else:
		back_button.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
		next_button.size_flags_horizontal = Control.SIZE_SHRINK_END | Control.SIZE_EXPAND
	update_step_count_display(index)

func test_completed() -> void:
	is_chronometer = false
	var total := answers.size()
	var correct_answers := selected_answers.count(true) + 1
	var qualification := (float(correct_answers) / float(total)) * 100.0
	Manager.data["evaluaciones"][current_item]["puntuaciones"].append(qualification)
	Manager.data["evaluaciones"][current_item]["tiempo"] = str(hours).pad_zeros(2) + ":" + str(minutes).pad_zeros(2) + ":" + str(int(seconds)).pad_zeros(2)
	Manager.data["evaluaciones"][current_item]["fecha"] = Time.get_datetime_string_from_system(false, true)
	if Manager.data["evaluaciones"][current_item]["intentos"] == 0: Manager.data["total_completado"] += progress_value
	Manager.data["evaluaciones"][current_item]["intentos"] += 1
	Manager.data["evaluaciones"][current_item]["bloqueado"] = true if qualification == 100 else false
	Manager.data["lecciones"][next_item]["bloqueado"] = false
	if !code.is_empty() && !practice.is_empty(): Manager.data["practicas"][practice]["codigo"] = code
	if Manager.data["total_completado"] == 100:
		if Manager.data["evaluaciones"]["prueba1"]["puntuaciones"].contains(100) && Manager.data["evaluaciones"]["prueba2"]["puntuaciones"].contains(100) && Manager.data["evaluaciones"]["prueba3"]["puntuaciones"].contains(100):
			Manager.run(["logout_user"], true)
			Manager.run(["disable_user"], true)
			Manager.reset_data()
	Manager.save_user()
	Manager.run(["update_user"], true)
	godette.change_expression(godette.Expressions.SURPRISED)
	particles_finish.emitting = true
	sd_finished.play()
	await sd_finished.finished
	finish_button.disabled = false

func lesson_completed() -> void:
	var is_completed : bool = Manager.data["lecciones"][current_item]["completado"]
	is_chronometer = false
	if !is_completed:
		Manager.data["lecciones"][current_item]["completado"] = true
		if !next_item.is_empty(): Manager.data["lecciones"][next_item]["bloqueado"] = false
		Manager.data["lecciones"][current_item]["tiempo"] = str(hours).pad_zeros(2) + ":" + str(minutes).pad_zeros(2) + ":" + str(int(seconds)).pad_zeros(2)
		Manager.data["lecciones"][current_item]["fecha"] = Time.get_datetime_string_from_system(false, true)
		if errors.size() != 0: Manager.data["practicas"][practice]["errores"] = errors.size()
		if !code.is_empty(): Manager.data["practicas"][practice]["codigo"] = code
		Manager.data["total_completado"] += progress_value
		if current_item == "tipos_de_datos":
			Manager.data["evaluaciones"]["prueba_1"]["bloqueado"] = false
		elif current_item == "condicionales":
			Manager.data["evaluaciones"]["prueba_2"]["bloqueado"] = false
		elif current_item == "condicionales":
			Manager.data["evaluaciones"]["prueba_3"]["bloqueado"] = false
		Manager.save_user()
		Manager.run(["update_user"], true)
		godette.change_expression(godette.Expressions.SURPRISED)
		particles_finish.emitting = true
		sd_finished.play()
		await sd_finished.finished
		godette.congrat_dialog()
		finish_button.disabled = false
	else:
		finish_button.disabled = false
		godette.review_dialog()
		godette.change_expression(godette.Expressions.SMILING)

func set_current_item(p_current : String) -> void:
	current_item = p_current

func set_next_item(p_next : String) -> void:
	next_item = p_next

func set_practice(p_practice : String) -> void:
	practice = p_practice

func set_progress_value(p_progress_value : float) -> void:
	progress_value = p_progress_value

func active_evaluation_mode(p_mode : bool) -> void:
	evaluation_mode = p_mode

func clear() -> void:
	next_button.visible = true
	set_background(null)
	clear_elements()

func clear_elements() -> void:
	for control in [main_v_box_container, tasks_v_box_container, answers_v_box_container]:
		for node in control.get_children():
			node.queue_free()
		control.visible = false
	help_v_box_container.visible = false

func add_element(element: Control, data: Variant, param: Variant = 0) -> void:
	main_v_box_container.visible = true
	main_v_box_container.add_child(element)
	if element is RichTextLabel or element is CodeEdit:
		element.text = data
	elif element is TextureRect:
		element.texture = data
		element.custom_minimum_size = param
		element.size = param
	elif element is VideoStreamPlayer:
		element.stream = data
		element.finished.connect(element.play)
		element.play()

func set_title(title_text: String) -> void:
	title_label.text = title_text

func add_text(text: Array[String]) -> void:
	for line in text:
		add_element(RichTextLabelPackedScene.instantiate(), line)

func add_code(code: Array[String]) -> void:
	for snippet in code:
		add_element(CodeEditPackedScene.instantiate(), snippet)

func add_texture(texture: Texture2D, size : Vector2) -> void:
	if texture == null:
		return
	add_element(TextureRectPackedScene.instantiate(), texture, size)

func add_video(stream: VideoStream) -> void:
	if stream == null or not stream is VideoStream:
		return
	add_element(VideoStreamPlayerPackedScene.instantiate(), stream)

func add_task(description: String, help : bool, repeat: int, repeat_callable: Callable, error_predicate: Callable) -> void:
	tasks_v_box_container.visible = true
	help_v_box_container.visible = help
	var task := TaskPackedScene.instantiate()
	tasks_v_box_container.add_child(task)
	task.status_changed.connect(check_tasks)
	task.setup(description, repeat, repeat_callable, error_predicate)
	check_tasks()

func add_answer(description : String, correct : bool) -> void:
	answers_v_box_container.visible = true
	var answer := AnswerPackedScene.instantiate()
	answers_v_box_container.add_child(answer)
	if answers.has(description): answer.select()
	answer.setup(description, correct)
	answer.pressed.connect(check_answer)

func set_background(material : ShaderMaterial) -> void:
	background.material = material

func check_answer() -> void:
	var selectable_option := SelectableOption.group.get_pressed_button()
	selected_answers[step] = selectable_option.is_correct
	answers[step] = selectable_option.text

func check_tasks() -> bool:
	var are_tasks_done := tasks_v_box_container.get_children().all(func(task: Task) -> bool: return task.is_done())
	next_button.visible = are_tasks_done
	return are_tasks_done

func update_step_count_display(current_step_index: int) -> void:
	step_count_label.text = "%s/%s" % [current_step_index, step_count - 2]
	step_count_label.visible = current_step_index != 0 and current_step_index != step_count - 1

func _add_debug_shortcuts() -> void:
	next_button.shortcut = load("res://addons/godot-course/bubble/shortcut_debug_button_next.tres")
	back_button.shortcut = load("res://addons/godot-course/bubble/shortcut_debug_button_back.tres")
	button_close_yes.shortcut = load("res://addons/godot-course/bubble/shortcut_debug_button_close.tres")
