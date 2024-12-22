extends Node

enum Visibility {
	SHOW,
	HIDE
}

enum Operator {
	GT,
	GTE,
	ET,
	LTE,
	LT,
	NE
}

func operator_to_string(operator: Operator) -> String:
	match operator:
		Operator.GT:
			return ">"
		Operator.GTE:
			return ">="
		Operator.ET:
			return "=="
		Operator.LTE:
			return "<="
		Operator.LT:
			return "<"
		Operator.NE:
			return "!"
		_:
			return "ERROR"

enum Rarity {
	NORMAL,
	MAGIC,
	RARE,
	UNIQUE
}
