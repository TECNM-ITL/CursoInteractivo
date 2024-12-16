@tool
extends Node

const FILE_PATH := "user://saves/"
const USER_FILE := "data.json"

const ITEMS_ID := [
	"que_es_godot",
	"editor_tour",
	"nodos",
	"hola_gdscript",
	"variables",
	"constantes",
	"tipos_de_datos",
	"funciones",
	"operadores",
	"condicionales",
	"ciclos",
	"listas",
	"errores",
	"proyecto",
	"jugador_escena",
	"programar_jugador",
	"creando_enemigo",
	"escena_principal",
	"interfaz_usuario",
	"finalizando",
	"prueba_1",
	"prueba_2",
	"prueba_3"
]

const DEFAULT_DATA := {
	"nombre" : "",
	"apellidos" : "",
	"email" : "",
	"password" : "",
	"n_control" : "",
	"sexo" : "",
	"edad" : 0,
	"sesion" : false,
	"total_completado" : 0.0,
	"fecha_registro" : "",
	"tiempo_registro" : "",
	"lecciones" : {
		ITEMS_ID[0] :{
			"completado" : false,
			"bloqueado" : false,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[1] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[2] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[3] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[4] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[5] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[6] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[7] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[8] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[9] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[10] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[11] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[12] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[13] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[14] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[15] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[16] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[17] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[18] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		},
		ITEMS_ID[19] : {
			"completado" : false,
			"bloqueado" : true,
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0"
		}
	},
	"evaluaciones" : {
		ITEMS_ID[20] : {
			"bloqueado" : true,
			"puntuaciones" : [],
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0",
			"intentos" : 0,
		},
		ITEMS_ID[21] : {
			"bloqueado" : true,
			"puntuaciones" : [],
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0",
			"intentos" : 0,
		},
		ITEMS_ID[22] : {
			"bloqueado" : true,
			"puntuaciones" : [],
			"tiempo" : "00:00:00",
			"fecha" : "0/0/0",
			"intentos" : 0,
		}
	},
	"practicas" : {
		"practica_1" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_2" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_3" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_4" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_5" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_6" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_7" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_8" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_9" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		},
		"practica_10" : {
			"errores" : 0,
			"codigo" : "",
			"ayuda" : false,
			"solucion" : false,
		}
	}
}

var data := DEFAULT_DATA.duplicate()

var connected := false
var output : String

func run(args : Array, independent : bool = false) -> void:
	load_user()
	if !connected && args[0] == "update_user" && data["email"].is_empty(): return
	
	var program_file := OS.get_data_dir() + "/Godot/app_userdata/Godot Interactive Course/database.exe"
	var temp_out : Array[String]
	if independent:
		OS.create_process(program_file, args)
	else: 
		OS.execute(program_file, args, temp_out)
		output = temp_out[0]

func save_user() -> void:
	if !DirAccess.dir_exists_absolute(FILE_PATH):
		DirAccess.make_dir_absolute(FILE_PATH)
	
	var user_save_file := FileAccess.open(FILE_PATH + USER_FILE, FileAccess.WRITE)
	var json_data := JSON.stringify(data, "\t")
	user_save_file.store_line(json_data)
	user_save_file.close()

func load_user() -> void:
	if !user_exists(): return
	
	var user_save_file := FileAccess.open(FILE_PATH + USER_FILE, FileAccess.READ)
	var json_string := user_save_file.get_as_text()
	user_save_file.close()
	
	var json := JSON.new()
	var error := json.parse(json_string)
	if error:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
		return
	
	data = json.data

func reset_data() -> void:
	data = DEFAULT_DATA.duplicate()

func user_exists() -> bool:
	return FileAccess.file_exists(FILE_PATH + USER_FILE)
