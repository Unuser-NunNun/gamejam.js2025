extends Employee
class_name MinerEmployee

var dailyOutput: int
var minedPerEmployee: int = 3

func _init(Wage: float, Count: int) -> void:
	super("miner",Wage,Count)

func startTask() -> void:
	updateDailyOutput()
	debug()
	onTaskCompleted.emit()

func updateDailyOutput() -> void:
	dailyOutput = (getEmployeeTotal()*minedPerEmployee)

func getDailyOutput() -> int:
	return dailyOutput

func getMinedPerEmployee() -> int:
	return minedPerEmployee

func debug() -> void:
	print("Collected Amount of Raw Ore: " + str(getDailyOutput()))
