extends ColorRect
class_name Divider

var vertical = true
var hovering = false
var held = false

func _ready():
	if get_parent() is HBoxContainer:
		vertical = false
		mouse_default_cursor_shape = Control.CURSOR_HSIZE
	return
	
func _process(delta):
	if hovering and Input.is_action_just_pressed("lmb"):
		held = true
	if not Input.is_action_pressed("lmb"):
		held = false
	return

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false
