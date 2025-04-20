extends Node

var chanceOfFailure: int = 100

func update() -> void:
	var reduction: int = EmployeeManager.getInfrastructureEmployee().getReductionRate()
	chanceOfFailure = max(chanceOfFailure-reduction,0)
	

func maintenenceCheck() -> void:
	update()
	var roll: int = randi_range(1,100)
	if (chanceOfFailure < roll):
		pass #Fail
