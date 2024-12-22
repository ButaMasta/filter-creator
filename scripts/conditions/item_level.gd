extends Control

@export var operator_with_numeric: HBoxContainer
var format_string = "ItemLevel %s %d"
var operator: String = ">="
var numeric: int = 0

func _ready() -> void:
	operator_with_numeric.initialize("Item Level", "Level")


func _on_operator_with_numeric_operator_change(new_operator: int) -> void:
	operator = FilterEnums.operator_to_string(new_operator)


func _on_operator_with_numeric_numeric_change(new_numeric: int) -> void:
	numeric = new_numeric


func _to_string() -> String:
	return format_string % [operator, numeric]
