extends HBoxContainer
class_name HBoxResizable

var dividers: Array[Divider]
var resizables: Array[Control]

func _ready():
    for child in get_children():
        if child is Divider:
            dividers.append(child)
        if child is HBoxResizable or child is VBoxResizable:
            resizables.append(child)
    #get_child(get_child_count()-1).expand=true

func _process(_delta):
    for divider in dividers:
        if divider.held:
            drag_mouse(divider.get_index())

func resize(difference):
    check_width(get_child_count()-1, difference.x, -1)
    for resizable in resizables:
        resizable.resize(difference)

func drag_mouse(idx):
    var left = get_child(idx-1)
    var left_resizable = left.get_node("Resizable");

    var current_left_size = left.custom_minimum_size.x
    var difference = get_global_mouse_position().x - left.position.x - current_left_size

    var new_left_size = current_left_size + difference
    if new_left_size > left_resizable.max_x or new_left_size < left_resizable.min_x:
        return

    if check_width(idx+1, difference, 1):
        left.custom_minimum_size.x = new_left_size


func check_width(idx, difference, direction) -> bool:
    if idx > get_child_count() or idx < 0:
        return false
    var control = get_child(idx)
    var control_resizable = control.get_node("Resizable")
    var new_control_size = control.custom_minimum_size.x - difference
    if new_control_size > control_resizable.max_x or new_control_size < control_resizable.min_x:
        return check_width(idx+2*direction, difference, direction)
    else:
        control.custom_minimum_size.x = new_control_size
        return true

func get_min_size(minimum) -> Vector2:
    for child in get_children():
        var resizable = child.get_node("Resizable")
        if resizable == null:
            continue
        minimum.x += resizable.min_x
        minimum.y += resizable.min_y
    for resizable in resizables:
        minimum += resizable.get_min_size(Vector2(0,0))
    return minimum



