extends Node
class_name Employee

var employeeJob: String
var employeeWage: float
var employeeCount: int 

signal onTaskCompleted

func _init(Job: String, Wage: float, Count: int) -> void:
	employeeJob = Job
	employeeWage = Wage
	employeeCount = Count

func hireEmployee(amount: int) -> void:
	employeeCount += amount

func fireEmployee(amount: int) -> void:
	employeeCount = max(employeeCount-amount,0)

func changeEmployeeWage(amount: int) -> void:
	if (amount < 0):
		employeeWage = max(employeeWage-amount,0)
		return
	employeeWage += amount

func getEmployeeTotal() -> int:
	return employeeCount

func getEmployeeWage() -> float:
	return employeeWage

func getEmployeeJob() -> String:
	return employeeJob.to_lower()

func getTotalWage() -> float:
	return employeeCount*employeeWage
