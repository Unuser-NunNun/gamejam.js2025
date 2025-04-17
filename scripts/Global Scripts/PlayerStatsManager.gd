extends Node


var electricityCost: float = 12

var gasCost: float = 8

var BuildingMaintenanceCost: float = 10

var totalProfits: float = 1000.00

var dailyRevenue: float = 150.00

signal onInit()


func getTotalMaintenanceCost() -> float:
	return BuildingMaintenanceCost+(EmployeeManager.getTotalNecessitiesCost())
	
func getUtilitiesCost() -> float:
	return electricityCost + gasCost

func getDailyCosts() -> float:
	return getUtilitiesCost()+EmployeeManager.getWageCosts()+getTotalMaintenanceCost()

func getTotalProfit() -> float:
	return totalProfits

func getDailyRevenue() -> float:
	return dailyRevenue

func addTotalProfit(amount: float) -> void:
	totalProfits += amount

func addDailyRevenue(amount: float) -> void:
	dailyRevenue += amount

func endOfDayProfit(_currentDay: int) -> void:
	addTotalProfit(dailyRevenue-getDailyCosts())

func _ready() -> void:
	getDailyCosts()
	GameManager.onNewDay.connect(endOfDayProfit)
	onInit.emit()
