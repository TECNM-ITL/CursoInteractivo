@tool
extends Button

const ThemeUtils = preload("res://addons/godot-course/ui/theme_utils.gd")

@onready var click = %Click

func setup() -> void:
	theme = ThemeUtils.generate_scaled_theme(theme)
	ThemeUtils.scale_font_size(self)

func _on_pressed():
	click.play()
	OS.shell_open("https://drive.google.com/file/d/1Qx_3u-q4nSI_y-hnJfbzRTI3aFvgUpPO/view?usp=sharing")
