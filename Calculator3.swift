func setOperand(operand: Double) {
	accumulator = operand
	descriptionAccumulator = String(format: "%g", accumulator)
}

private var operations : [String: Operation] = [
	"rand": Operation.NullaryOperation(drand48, "rand()"),
	"π": Operation.Constant(M_PI),
	"e": Operation.Constant(M_E),
	"±": Operation.UnaryOperation({ -$0 }, { "-(" + $0 + ")"}),
	"√": Operation.UnaryOperation(sqrt, { "√(" +$0 + ")"}),
	"cos": Operation.UnaryOperation(cos,{ "cos(" + $0 + ")"}),
	"sin": Operation.UnaryOperation(sin,{ "sin(" + $0 + ")"}),
	"tan": Operation.UnaryOperation(tan,{ "tan(" + $0 + ")"}),
	"ln": Operation.UnaryOperation(log, { "ln(" + $0 + ")"}),
	"x": Operation.UnaryOperation(*, { $0 + " x " + $1 }, 1),
	"÷": Operation.UnaryOperation(/, { $0 + " ÷ " + $1 }, 1),
	"+": Operation.UnaryOperation(+, { $0 + " + " + $1 }, 0),
	"-": Operation.UnaryOperation(-, { $0 + " - " + $1 }, 0),
	"=": Operation.Equals,
	"C" : Operation.C
]