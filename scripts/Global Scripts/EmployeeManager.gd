extends Node

var minerEmployee: MinerEmployee

var factoryEmployee: FactoryEmployee

var shipperEmployee: ShipperEmployee

var infrastructureEmployee: InfrastructureEmployee

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

func updateEmployees() -> void:
	minerEmployee.startTask()

func minerCompletedTask() -> void:
	var rawOre: int = minerEmployee.getDailyOutput()
	factoryEmployee.changeRawOreAmount(rawOre)
	factoryEmployee.startTask()

func factoryCompletedTask() -> void:
	var collectedOre: int = factoryEmployee.shipOutput(shipperEmployee.getCollectionAmount())
	shipperEmployee.startTask(collectedOre)

func shipperCompletedTask() -> void:
	pass

func _ready() -> void:
	minerEmployee = MinerEmployee.new(2.5,10)
	factoryEmployee = FactoryEmployee.new(3,5)
	shipperEmployee = ShipperEmployee.new(3,2)
	infrastructureEmployee = InfrastructureEmployee.new(5,3)
	
	minerEmployee.onTaskCompleted.connect(minerCompletedTask)
	factoryEmployee.onTaskCompleted.connect(factoryCompletedTask)
	shipperEmployee.onTaskCompleted.connect(shipperCompletedTask)
	onInit.emit()
