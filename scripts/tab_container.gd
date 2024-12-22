extends TabContainer

@export var files: FileDialog


func _ready() -> void:
	set_tab_title(0, "Create/Import")
