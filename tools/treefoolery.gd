extends Tree

@export var left_style: StyleBoxFlat
@export var middle_style: StyleBoxFlat
@export var right_style: StyleBoxFlat

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = create_item()
	root.set_text(0,"SDFAFDFF")
	var child = add_row(root,"xasdfasdfsadf","y","z")

func add_row(parent,a,b,c):
	var child = create_item(parent)
	child.set
	child.set_text(0,a)
	#child.set_text(1,b)
	#child.set_text(2,c)
	child.set_cell_mode(0,TreeItem.CELL_MODE_STRING)
	#child.set_cell_mode(1,TreeItem.CELL_MODE_CUSTOM)
	#child.set_cell_mode(2,TreeItem.CELL_MODE_CUSTOM)
