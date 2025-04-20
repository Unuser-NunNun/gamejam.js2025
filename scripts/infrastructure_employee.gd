extends Employee
class_name InfrastructureEmployee

var failureReductionPerEmployee: int = 20
var reducedFailRate: int = 0

func _init(Wage: float, Count: int) -> void:
	super("infrastructure",Wage,Count);

func getReductionRate() -> int:
	return reducedFailRate

func updateFailureRate() -> void:
	var growth =1-pow(exp(1),-0.25*getEmployeeTotal())
	reducedFailRate = roundi(100*growth)
	print("Failure Reduction Amount: " + str(reducedFailRate))
