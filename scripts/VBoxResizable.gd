extends VBoxContainer
class_name VBoxResizable

var dividers: Array[Divider];
var resizables: Array[Control];

func _ready():
    for child in get_children():
        if child is Divider:
            dividers.append(child)
        if child is HBoxResizable or child is VBoxResizable:
            resizables.append(child)

func _process(_delta):
    for divider in dividers:
        if divider.held:
            drag_mouse(divider.get_index())

func resize(difference):
    check_width(get_child_count()-1, difference.y, -1)
    for resizable in resizables:
        resizable.resize(difference)

func drag_mouse(idx):
    var top = get_child(idx-1)
    var top_resizable = top.get_node("Resizable");

    var current_top_size = top.custom_minimum_size.y
    var difference = get_global_mouse_position().y - top.position.y - current_top_size

    var new_top_size = current_top_size + difference
    if new_top_size > top_resizable.max_y or new_top_size < top_resizable.min_y:
        return

    if check_width(idx+1, difference, 1):
        top.custom_minimum_size.y = new_top_size


func check_width(idx, difference, direction) -> bool:
    if idx > get_child_count() or idx < 0:
        return false
    var control = get_child(idx)
    var control_resizable = control.get_node("Resizable")
    var new_control_size = control.custom_minimum_size.y - difference
    if new_control_size > control_resizable.max_y or new_control_size < control_resizable.min_y:
        return check_width(idx+2*direction, difference, direction)
    else:
        control.custom_minimum_size.y = new_control_size
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










