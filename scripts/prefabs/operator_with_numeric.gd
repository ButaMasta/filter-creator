extends HBoxContainer

@export var label: Label
@export var numeric: Label
signal operator_change(new_operator: FilterEnums.Operator)
signal numeric_change(new_numeric: int)

func initialize(label_text: String = "ERROR",
				numeric_text: String = "ERROR") -> void:
	label.text = label_text
	numeric.text = numeric_text
	


func _on_operator_item_selected(operator: int) -> void:
	operator_change.emit(operator)


func _on_value_text_submitted(new_text: String) -> void:
	numeric_change.emit(int(new_text))
