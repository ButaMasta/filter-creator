extends MarginContainer

@export var label: Button
var data: Dictionary

func initialize(filter_name: String = "Filter Option",
				visibility: FilterEnums.Visibility = FilterEnums.Visibility.SHOW,
				rarity: Array = [FilterEnums.Operator.GTE, FilterEnums.Rarity.MAGIC]) -> void:
	data = {
		"filter_name"		: filter_name,
		"visibility"		: visibility,
		"rarity"			: rarity
	}
	label.text = filter_name

######################
##	Print			##
######################
func filter_option_tostring() -> String:
	return ""


func get_data() -> Dictionary:
	return data

######################
##	Filter Name		##
######################
func set_label(new_text: String = "Filter Option") -> void:
	if new_text.length() < 1:
		label.text = "Filter Option"
		data.filter_name = "Filter Option"
	else:
		label.text = new_text
		data.filter_name = new_text

func get_label() -> String:
	return data.filter_name


######################
##	Visibility		##
######################
func get_visibility() -> String:
	match data.visibility:
		FilterEnums.Visibility.SHOW:
			return "Show"
		FilterEnums.Visibility.HIDE:
			return "Hide"
		_:
			return "ERROR"

func set_visibility(visibility: FilterEnums.Visibility):
	data.visibility = visibility


######################
##	Rarity Operator	##
######################
func get_rarity_operator() -> String:
	match data.rarity[0]:
		FilterEnums.Operator.GT:
			return ">"
		FilterEnums.Operator.GTE:
			return ">="
		FilterEnums.Operator.ET:
			return "=="
		FilterEnums.Operator.LTE:
			return "<="
		FilterEnums.Operator.LT:
			return "<"
		FilterEnums.Operator.NE:
			return "!"
		_:
			return "ERROR"

func set_rarity_operator(operator: FilterEnums.Operator):
	data.rarity[0] = operator


######################
##	Rarity 			##
######################
func get_rarity() -> String:
	match data.rarity[1]:
		FilterEnums.Rarity.NORMAL:
			return "Normal"
		FilterEnums.Rarity.MAGIC:
			return "Magic"
		FilterEnums.Rarity.RARE:
			return "Rare"
		FilterEnums.Rarity.UNIQUE:
			return "Unique"
		_:
			return "ERROR"

func set_rarity(rarity: FilterEnums.Rarity):
	data.rarity[1] = rarity

func _on_label_pressed() -> void:
	FilterSignals.option_pressed.emit(self)


func _on_delete_pressed() -> void:
	FilterSignals.delete_request.emit(self)
