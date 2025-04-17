extends Node

var minerEmployee: Employee

var factoryEmployee: Employee

var shipperEmployee: Employee

var infrastructureEmployee: Employee

var necessitiesCostPerEmployee: float = 0.75

signal onInit()


func getMinerEmployee() -> Employee:
	return minerEmployee
	
func getFactoryEmployee() -> Employee:
	return factoryEmployee

func getShipperEmployee() -> Employee:
	return shipperEmployee

func getInfrastructureEmployee() -> Employee:
	return infrastructureEmployee

func getNecessitiesCost() -> float:
	return necessitiesCostPerEmployee

func changeNecessitiesCost(amount: int) -> void:
	if (amount < 0):
		necessitiesCostPerEmployee = max(necessitiesCostPerEmployee-amount,0)
		return
	necessitiesCostPerEmployee += amount 

func getTotalEmployees() -> int:
	return minerEmployee.getEmployeeTotal()+factoryEmployee.getEmployeeTotal()+shipperEmployee.getEmployeeTotal()+infrastructureEmployee.getEmployeeTotal()

func getWageCosts() -> float:
	return minerEmployee.getTotalWage()+factoryEmployee.getTotalWage()+shipperEmployee.getTotalWage()+infrastructureEmployee.getTotalWage()

func getTotalNecessitiesCost() -> float:
	return getTotalEmployees()*necessitiesCostPerEmployee

func _ready() -> void:
	minerEmployee = Employee.new("miner",2.5,10)
	factoryEmployee = Employee.new("factory",3,5)
	shipperEmployee = Employee.new("shipper",3,2)
	infrastructureEmployee = Employee.new("infrastucture",5,3)
	onInit.emit()
