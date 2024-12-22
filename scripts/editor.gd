extends VBoxContainer

@export var name_edit: LineEdit
@export var visibility: OptionButton
@export var rarity_operator: OptionButton
@export var rarity: OptionButton
var filter_option

func _ready() -> void:
	FilterSignals.option_pressed.connect(_on_option_pressed)


func _on_option_pressed(new_filter_option):
	var data = new_filter_option.get_data()
	
	name_edit.text = data.filter_name
	name_edit.editable = true
	visibility.select(data.visibility)
	visibility.disabled = false
	rarity_operator.select(data.rarity[0])
	rarity_operator.disabled = false
	rarity.select(data.rarity[1])
	rarity.disabled = false

	filter_option = new_filter_option
	

func _on_name_text_submitted(new_text: String) -> void:
	filter_option.set_label(new_text)


func _on_visibility_item_selected(new_visibility: FilterEnums.Visibility) -> void:
	filter_option.set_visibility(new_visibility)


func _on_rarity_operator_item_selected(new_rarity_operator: FilterEnums.Operator) -> void:
	filter_option.set_rarity_operator(new_rarity_operator)


func _on_rarity_item_selected(new_rarity: FilterEnums.Rarity) -> void:
	filter_option.set_rarity(new_rarity)
