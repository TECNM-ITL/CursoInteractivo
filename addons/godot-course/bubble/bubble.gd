## Base class for the text bubble used to display instructions to the user.
## Check out ["addons/godot_tours/bubble/default_bubble.gd"] for the default implementation.
@tool
extends CanvasLayer

## Emitted to go backward one step in the tour.
signal back_button_pressed
## Emitted to go forward one step in the tour.
signal next_button_pressed
## Emitted when the user confirms wanting to quit the tour.
signal close_requested

const Task := preload("task/task.gd")
const EditorInterfaceAccess := preload("../editor_interface_access.gd")
const ThemeUtils := preload("../ui/theme_utils.gd")

const TaskPackedScene: PackedScene = preload("task/task.tscn")
const AnswerPackedScene: PackedScene = preload("answer/option.tscn")

const TWEEN_DURATION := 0.25

## Location to place and anchor the bubble relative to a given Control node [b]inside its rectangle[/b]. Used in the
## function [method move_and_anchor] and by the [member at] variable.
enum At {
	TOP_LEFT,
	TOP_RIGHT,
	BOTTOM_RIGHT,
	BOTTOM_LEFT,
	CENTER_LEFT,
	TOP_CENTER,
	BOTTOM_CENTER,
	CENTER_RIGHT,
	CENTER,
}
## Location of the Avatar along the top edge of the bubble.
enum AvatarAt { LEFT, CENTER, RIGHT }

const GROW_DIRECTIONS := {
	At.TOP_LEFT: {h = Control.GROW_DIRECTION_END, v = Control.GROW_DIRECTION_END},
	At.TOP_RIGHT: {h = Control.GROW_DIRECTION_BEGIN, v = Control.GROW_DIRECTION_END},
	At.BOTTOM_RIGHT: {h = Control.GROW_DIRECTION_BEGIN, v = Control.GROW_DIRECTION_BEGIN},
	At.BOTTOM_LEFT: {h = Control.GROW_DIRECTION_END, v = Control.GROW_DIRECTION_BEGIN},
	At.CENTER_LEFT: {h = Control.GROW_DIRECTION_END, v = Control.GROW_DIRECTION_BOTH},
	At.TOP_CENTER: {h = Control.GROW_DIRECTION_BOTH, v = Control.GROW_DIRECTION_END},
	At.BOTTOM_CENTER: {h = Control.GROW_DIRECTION_BOTH, v = Control.GROW_DIRECTION_BEGIN},
	At.CENTER_RIGHT: {h = Control.GROW_DIRECTION_BEGIN, v = Control.GROW_DIRECTION_BOTH},
	At.CENTER: {h = Control.GROW_DIRECTION_BOTH, v = Control.GROW_DIRECTION_BOTH},
}

var at := At.CENTER  ## Bubble location relative to a given Control node. See [enum At] for details.
var avatar_at := AvatarAt.LEFT  ## Avatar location relative to the bubble. See [enum AvatarAt] for details.

## Margin offset for [method move_and_anchor]. It keeps the bubble at [code]margin[/code] pixels away relative to
## the Control border.
var margin := 16.0
var offset_vector := Vector2.ZERO  ## Custom offset for [method move_and_anchor] for extra control.
var control: Control = null  ## Reference to the control node passed to [method move_and_anchor].
var step_count := 0  ## Tour step count.
var drag_margin := 32.0 * EditorInterface.get_editor_scale()
var is_left_click := false
var was_moved := false
var is_chronometer := true

var tween: Tween = null
var avatar_tween_position: Tween = null
var avatar_tween_rotation: Tween = null

@onready var panel: PanelContainer = %Panel
@onready var godette: Node2D = %Godette

var seconds := 0.0
var minutes := 0
var hours := 0

func setup(step_count: int) -> void:
	self.step_count = step_count

func _ready() -> void:
	if not Engine.is_editor_hint() or EditorInterface.get_edited_scene_root() == self:
		return

	panel.gui_input.connect(_on_panel_container_gui_input)
	var editor_scale := EditorInterface.get_editor_scale()
	panel.custom_minimum_size *= editor_scale
	if panel.theme:
		panel.theme = ThemeUtils.generate_scaled_theme(panel.theme)

func _process(delta: float) -> void:
	# We call this function that updates the position and size of the bubble.
	# RichTextLabel nodes added to the bubble can cause it to resize after 0, 1, or 2 frames. It's not reliable
	# and depends on the computer. So, it's best to refresh every frame.
	refresh()
	chronometer(delta)

func _on_panel_container_gui_input(event: InputEvent) -> void:
	var is_event_in_margin: bool = (
		event is InputEventMouse
		and (
			event.position.y <= drag_margin
			or event.position.y >= panel.size.y - drag_margin
			or event.position.x <= drag_margin
			or event.position.x >= panel.size.x - drag_margin
		)
	)
	panel.mouse_default_cursor_shape = (
		Control.CURSOR_MOVE if is_event_in_margin else Control.CURSOR_ARROW
	)

	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and is_event_in_margin
	):
		is_left_click = event.pressed
	elif event is InputEventMouseMotion and is_left_click:
		panel.position += event.relative
		was_moved = true

func set_current_item(p_current : String) -> void:
	pass

func set_next_item(p_next : String) -> void:
	pass

func set_practice(p_practice : String) -> void:
	pass

func set_progress_value(p_progress_value : float) -> void:
	pass

func active_evaluation_mode(p_mode : bool) -> void:
	pass

## [b]Virtual[/b] method for reacting to the tour step change. See ["addons/godot_tours/tour.gd"]
## [code]step_changed[/code] signal for details.
func on_tour_step_changed(index: int) -> void:
	was_moved = false


## [b]Virtual[/b] method called at the beginning of every tour step for clearing anything necessary.
func clear() -> void:
	pass


## [b]Virtual[/b] method to set the bubble title.
func set_title(title_text: String) -> void:
	pass


## [b]Virtual[/b] method to insert lines of text.
func add_text(text: Array[String]) -> void:
	pass


## [b]Virtual[/b] method to insert a texture image.
func add_texture(texture: Texture2D, size : Vector2) -> void:
	pass


## [b]Virtual[/b] method to insert a video.
func add_video(video: VideoStream) -> void:
	pass


## [b]Virtual[/b] method to insert a code snippet.
func add_code(code: Array[String]) -> void:
	pass


## [b]Virtual[/b] method to change the displayed image.
func set_background(material : ShaderMaterial) -> void:
	pass

## [b]Virtual[/b] method to add a task.
func add_task(

	description: String,
	help: bool,
	repeat: int,
	repeat_callable: Callable,
	error_predicate: Callable
) -> void:
	pass

## [b]Virtual[/b] method to add a answer.
func add_answer(description : String, correct : bool) -> void:
	pass

func check_answers() -> void:
	pass

## [b]Virtual[/b] method for checking if all tasks are done.
## Returns [code]true[/code] or [code]false[/code] based on the status of all tasks.
func check_tasks() -> bool:
	return true


## Moves and anchors the bubble relative to the given control node. Check out [member at], [member margin], and
## [member offset_vector] for details on the parameters.
func move_and_anchor(
	control: Control, at := At.CENTER, margin := 16.0, offset_vector := Vector2.ZERO
) -> void:
	self.control = control
	self.at = at
	self.margin = margin
	self.offset_vector = offset_vector
	panel.grow_horizontal = GROW_DIRECTIONS[at].h
	panel.grow_vertical = GROW_DIRECTIONS[at].v

func set_avatar_dialog(dialog : AudioStream) -> void:
	await get_tree().create_timer(0.5).timeout
	godette.play_dialog(dialog)

func play_avatar_close_dialog() -> void:
	godette.close_dialog()

## Sets the avatar location at the top of the bubble. Check [member avatar_at] for details on the parameter.
func set_avatar_at(at := AvatarAt.LEFT) -> void:
	avatar_at = at
	var editor_scale := EditorInterface.get_editor_scale()
	var at_offset := {
		AvatarAt.LEFT: Vector2(-8.0, -20.0) * editor_scale,
		AvatarAt.CENTER: Vector2(panel.size.x / 2.0, -30.0 * editor_scale),
		AvatarAt.RIGHT: Vector2(panel.size.x + 3.0 * editor_scale, -20.0 * editor_scale),
	}
	var new_avatar_position: Vector2 = at_offset[at]

	const target_rotation_degrees := {
		AvatarAt.LEFT: -15.0,
		AvatarAt.CENTER: -4.0,
		AvatarAt.RIGHT: 7.5,
	}
	var new_avatar_rotation: float = target_rotation_degrees[at]

	const TWEEN_DURATION_AVATAR := 0.15

	if not godette.position.is_equal_approx(new_avatar_position):
		if avatar_tween_position != null:
			avatar_tween_position.kill()
		avatar_tween_position = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		avatar_tween_position.tween_property(
			godette, "position", new_avatar_position, TWEEN_DURATION_AVATAR
		)

	if not is_equal_approx(godette.rotation, new_avatar_rotation):
		if avatar_tween_rotation != null:
			avatar_tween_rotation.kill()
		avatar_tween_rotation = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		avatar_tween_rotation.tween_property(
			godette, "rotation_degrees", new_avatar_rotation, TWEEN_DURATION_AVATAR
		)

func hide_avatar() -> void:
	godette.hide()

## Refreshes the position and size of the bubble and its avatar as necessary.
func refresh() -> void:
	if was_moved or control == null:
		return
	
	panel.reset_size()
	var at_offset := {
		At.TOP_LEFT: margin * Vector2.ONE,
		At.TOP_CENTER:
		Vector2((control.size.x - panel.size.x) / 2.0, 0.0) + margin * Vector2.DOWN,
		At.TOP_RIGHT:
		Vector2(control.size.x - panel.size.x, 0.0) + margin * Vector2(-1.0, 1.0),
		At.BOTTOM_RIGHT: control.size - panel.size - margin * Vector2.ONE,
		At.BOTTOM_CENTER:
		Vector2(0.5, 1.0) * (control.size - panel.size) + margin * Vector2.UP,
		At.BOTTOM_LEFT:
		Vector2(0.0, control.size.y - panel.size.y) + margin * Vector2(1.0, -1.0),
		At.CENTER_LEFT:
		Vector2(0.0, (control.size.y - panel.size.y) / 2.0) + margin * Vector2.RIGHT,
		At.CENTER_RIGHT:
		Vector2(1.0, 0.5) * (control.size - panel.size) + margin * Vector2.LEFT,
		At.CENTER: (control.size - panel.size) / 2.0,
	}
	
	var new_global_position: Vector2 = control.global_position + at_offset[at] + offset_vector
	if not panel.global_position.is_equal_approx(new_global_position):
		if tween != null:
			tween.kill()
		tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(panel, "global_position", new_global_position, TWEEN_DURATION)
	set_avatar_at(avatar_at)


func chronometer(delta) -> void:
	if !is_chronometer:
		return
	
	seconds += delta
	if seconds >= 60:
		minutes += 1
		seconds = 0
	if minutes >= 60:
		hours += 1
		minutes = 0
