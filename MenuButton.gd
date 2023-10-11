extends MenuButton

var popup
var submenu = PopupMenu.new()
var subsubmenu = PopupMenu.new()

func _ready():
	popup = get_popup()

	subsubmenu.set_name("subsubmenu")
	subsubmenu.add_item("Sub-submenu item a")
	subsubmenu.add_item("Sub-submenu item b")

	submenu.set_name("submenu")
	submenu.add_item("Submenu item a")
	submenu.add_item("Submenu item b")
	submenu.add_child(subsubmenu)
	submenu.add_submenu_item("Sub-submenu", "subsubmenu")

	popup.add_item("Item a")
	popup.add_item("Item b")
	popup.add_child(submenu)
	popup.add_submenu_item("Submenu", "submenu")
