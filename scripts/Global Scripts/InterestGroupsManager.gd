extends Node

var government: InterestGroups
var employees: InterestGroups
var stockholders: InterestGroups
var consumers: InterestGroups

var governmentStartingRep: float = 80.0
var stockholdersStartingRep: float = 95.0
var consumersStartingRep: float = 90.0
var employeesStartingRep: float = 92.0

signal onInit()


func _ready() -> void:
	employees = EmployeesInterestGroup.new(employeesStartingRep)
	stockholders = StockholderInterestGroup.new(stockholdersStartingRep,5, 2) #Days between each check = 5. Warnings before game over = 2
	consumers = ConsumerInterestGroup.new(consumersStartingRep)
	government = GovernmentInterestGroup.new(governmentStartingRep)
	onInit.emit()


func getEmployeeInterestGroup() -> InterestGroups:
	return employees

func getGovernmentInterestGroup() -> InterestGroups:
	return government

func getStockholdersInterestGroup() -> InterestGroups:
	return stockholders

func getConsumersInterestGroup() -> InterestGroups:
	return consumers
