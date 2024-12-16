@tool
extends Node2D

const GODETTE_EXPLAINING := preload("res://addons/godot-course/bubble/godette/godette_explaining.png")
const GODETTE_SURPRISED := preload("res://addons/godot-course/bubble/godette/godette_surprised.png")
const GODETTE_SMILE := preload("res://addons/godot-course/bubble/godette/godette_smile.png")

const FELICITACIONES := preload("res://addons/godot-course/bubble/godette/audios/Felicitaciones.mp3")
const REPASO := preload("res://addons/godot-course/bubble/godette/audios/Repaso.mp3")
const SALIR := preload("res://addons/godot-course/bubble/godette/audios/Salir.mp3")

enum Expressions {
	EXPLAINING,
	SURPRISED,
	SMILING,
}

@onready var godette := %Godette
@onready var audio := %Audio
@onready var scale_start := scale

var current_audio := 0

func change_expression(exp : Expressions) -> void:
	match exp:
		Expressions.EXPLAINING:
			godette.texture = GODETTE_EXPLAINING
		Expressions.SURPRISED:
			godette.texture = GODETTE_SURPRISED
		Expressions.SMILING:
			godette.texture = GODETTE_SMILE

func play_dialog(dialog : AudioStream) -> void:
	audio.stop()
	audio.stream = dialog
	audio.play()

func congrat_dialog() -> void:
	audio.stop()
	audio.stream = FELICITACIONES
	audio.play()

func review_dialog() -> void:
	audio.stop()
	audio.stream = REPASO
	audio.play()

func close_dialog() -> void:
	audio.stop()
	audio.stream = SALIR
	audio.play()
