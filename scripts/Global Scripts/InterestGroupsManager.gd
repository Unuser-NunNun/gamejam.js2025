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
	stockholders = StockholderInterestGroup.new(stockholdersStartingRep) 
	consumers = ConsumerInterestGroup.new(consumersStartingRep)
	government = GovernmentInterestGroup.new(governmentStartingRep)
	onInit.emit()

func updateInterestGroups() -> void:
	stockholders.update()
	employees.update()
	consumers.update()
	government.update()

func getEmployeeInterestGroup() -> InterestGroups:
	return employees

func getGovernmentInterestGroup() -> InterestGroups:
	return government

func getStockholdersInterestGroup() -> InterestGroups:
	return stockholders

func getConsumersInterestGroup() -> InterestGroups:
	return consumers
