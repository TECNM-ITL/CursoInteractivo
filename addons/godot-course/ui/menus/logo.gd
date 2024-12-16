@tool
extends Control

const GODOT_WINK := preload("res://addons/godot-course/ui/godot/GodotWink.png")
const GODOT_MOUTH_OPEN = preload("res://addons/godot-course/ui/godot/GodotMouthOpen.png")

@onready var eyes := %Eyes
@onready var icon := %Icon

func _process(delta: float) -> void:
	var mouse_position := get_local_mouse_position()
	
	eyes.position.x = clamp(mouse_position.x, -3.0, 3.0)
	eyes.position.y = clamp(mouse_position.y, -3.0, 3.0)

func godot_wink() -> void:
	eyes.hide()
	icon.texture = GODOT_MOUTH_OPEN
	tween_scale()
	tween_rotate()
	await get_tree().create_timer(1.0).timeout
	icon.texture = GODOT_WINK

func tween_scale() -> void:
	var tween := create_tween()
	tween.tween_method(scale_godot,Vector2(0.1, 0.1), Vector2(0.15, 0.15), 0.5)
	tween.tween_method(scale_godot,Vector2(0.15, 0.15), Vector2(0.1, 0.1), 1.0)

func tween_rotate() -> void:
	var tween := create_tween()
	tween.tween_method(rotate, 0, 40, 0.7)
	tween.tween_method(rotate, 40, -60, 0.3)
	tween.tween_method(rotate, -60, 0, 0.5)

func scale_godot(p_sc : Vector2) -> void:
	eyes.scale = p_sc
	icon.scale = p_sc

func rotate(p_r : float) -> void:
	eyes.rotation = deg_to_rad(p_r)
	icon.rotation = deg_to_rad(p_r)
