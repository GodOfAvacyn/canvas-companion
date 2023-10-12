@tool
extends Node

var shortcut_held: bool = false

@export var high_res_scale_factor = 1.5

@export_group("Color Palette")
@export var dark_color: Color
@export var dark_color_resources: Array[Resource]
@export var medium_color: Color 
@export var medium_color_resources: Array[Resource]
@export var light_color: Color
@export var light_color_resources: Array[Resource]
@export var unfocused_text_color: Color
@export var unfocused_text_color_resources: Array[Resource]
@export var focused_text_color: Color
@export var focused_text_color_resources: Array[Resource]

@export_group("Tabs")
@export var tab_outer_padding: int
@export var tab_inner_padding: int
@export var tab_corner_radius: int
@export var tab_font_size: int

func set_color(name: String):
	var c = name + "_color"
	var arr = c + "_resources"
	for resource in self[arr]:
		resource.bg_color = self[c]

func _process(delta):
	if Input.is_key_pressed(KEY_ALT) and Input.is_key_pressed(KEY_R): 
		if not shortcut_held:
			for key in ["dark", "medium", "light", "unfocused_text", "focused_text"]:
				set_color(key)
			shortcut_held = true
	else:
		shortcut_held = false

func _on_window_resize():
	
