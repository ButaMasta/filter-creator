extends HBoxContainer

@export var label: Label
@export var value_label: Label
@export var value_selector: OptionButton
signal operator_change(new_operator: FilterEnums.Operator)
signal value_change(new_value: int)

func initialize(label_text: String = "ERROR",
				value_label_text: String = "ERROR",
				values: Array = ["ERROR"]) -> void:
	label.text = label_text
	value_label.text = value_label_text
	for value in values:
		value_selector.add_item(value)


func _on_operator_item_selected(operator: int) -> void:
	operator_change.emit(operator)


func _on_value_item_selected(value: int) -> void:
	value_change.emit(value)
