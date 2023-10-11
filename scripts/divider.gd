extends ColorRect

var vertical = true
var before: Control
var before_resizable: Resizable
var after: Control
var after_resizable: Resizable
var hovering = false
var held = false

func _ready():
	if get_parent() is HBoxContainer:
		vertical = false
		mouse_default_cursor_shape = Control.CURSOR_HSIZE
	before = get_parent().get_child(get_index()-1)
	after = get_parent().get_child(get_index()+1)
	before_resizable = before.get_node("Resizable")
	after_resizable = after.get_node("Resizable")
	
func _process(delta):
	if hovering and Input.is_action_just_pressed("lmb"):
		held = true
	if not Input.is_action_pressed("lmb"):
		held = false
	if vertical: resize_y()
	else: resize_x()

func resize_x():
	if not held: return
	var current_before_size = before.custom_minimum_size.x
	var difference = get_global_mouse_position().x - before.position.x - current_before_size
	var new_before_size = current_before_size + difference
	var new_after_size = after.custom_minimum_size.x - difference
	print(after.custom_minimum_size.x)
	if new_before_size > before_resizable.max_x or new_before_size < before_resizable.min_x:
		print("new before: " + str(new_before_size))
		print(str(difference))
		return
	if new_after_size > after_resizable.max_x or new_after_size < after_resizable.min_x:
		print(after.custom_minimum_size.x)
		print("new after: " + str(new_after_size))
		print(str(difference))
		return
	before.custom_minimum_size.x = new_before_size
	after.custom_minimum_size.x = new_after_size
	
func resize_y():
	if not held: return
	var current_before_size = before.custom_minimum_size.y
	var difference = get_global_mouse_position().y - before.position.y - current_before_size
	var new_before_size = current_before_size + difference
	var new_after_size = after.custom_minimum_size.y - difference
	if new_before_size > before_resizable.max_y or new_before_size < before_resizable.min_y:
		print("new before: " + str(new_before_size))
		print(str(difference))
		return
	if new_after_size > after_resizable.max_y or new_after_size < after_resizable.min_y:
		print("new after: " + str(new_after_size))
		print(str(difference))
		return
	before.custom_minimum_size.y = new_before_size
	after.custom_minimum_size.y = new_after_size
	

func _on_mouse_entered():
	hovering = true

func _on_mouse_exited():
	hovering = false
