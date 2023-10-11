extends Node
class_name WindowResizer

@onready var control = $".."

func _ready():
    DisplayServer.window_set_min_size(control.custom_minimum_size)
    
