extends Control

var child: HBoxResizable
var old_size: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
    child = get_child(0)
    print(child.name)
    DisplayServer.window_set_min_size(child.get_min_size(Vector2(0,0)))

func _on_control_resized():
    if child == null:
        return
    child.resize(old_size - size) 
    old_size = size
