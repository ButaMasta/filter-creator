extends Control

@export var operator_with_value: HBoxContainer
var values: Array = ["Normal", "Magic", "Rare", "Unique"]
var format_string = "Rarity %s %s"
var operator: String = ">="
var value: String = "ERROR"


func _ready() -> void:
	operator_with_value.initialize("Rarity", "Rarity", values)


func _on_operator_with_value_operator_change(new_operator: int) -> void:
	operator = FilterEnums.operator_to_string(new_operator)


func _on_operator_with_value_value_change(new_value: int) -> void:
	value = values[new_value]


func _to_string() -> String:
	return format_string % [operator, value]
