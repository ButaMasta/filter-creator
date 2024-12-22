extends VBoxContainer

@export var files: FileDialog
@export var confirm: ConfirmationDialog
var filter_option_delete = null
@export var filter_list: VBoxContainer
@export var editor: VBoxContainer
@onready var filter_option_base: PackedScene = load("res://scenes/filter_option.tscn") as PackedScene
var counter = 0

func _ready() -> void:
	files.current_dir = OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)
	FilterSignals.delete_request.connect(_on_deletion_request)

func add_filter_option():
	var filter_option = filter_option_base.instantiate()
	filter_option.initialize("test")
	filter_option.name += str(counter)
	filter_list.add_child(filter_option)
	counter += 1
	

func _on_add_pressed() -> void:
	add_filter_option()


func _on_create_button_pressed() -> void:
	add_filter_option()
	add_filter_option()
	add_filter_option()
	add_filter_option()
	add_filter_option()


func _on_import_button_pressed() -> void:
	files.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	files.popup_centered()


func _on_save_pressed() -> void:
	files.file_mode = FileDialog.FILE_MODE_SAVE_FILE
	files.popup_centered()


func _on_file_dialog_file_selected(path: String) -> void:
	var file = FileAccess.open(path, FileAccess.WRITE)
	for filter_option in filter_list.get_children():
		file.store_line(filter_option.get_label())
	file.close()


func _on_deletion_request(filter_option) -> void:
	filter_option_delete = filter_option
	confirm.popup_centered()


func _on_confirmation_dialog_confirmed() -> void:
	filter_option_delete.queue_free()
	filter_option_delete = null

func _on_confirmation_dialog_canceled() -> void:
	filter_option_delete = null
