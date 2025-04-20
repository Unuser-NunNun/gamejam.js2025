extends Node


var electricityCost: float = 12

var gasCost: float = 8

var BuildingMaintenanceCost: float = 10

var totalProfits: float = 1000.00

var dailyRevenue: float

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

func getDailyProfit() -> float:
	return dailyRevenue-getDailyCosts()
	
func endOfDayProfit() -> void:
	print("Daily Expenses: " + str(getDailyCosts()))
	addTotalProfit(dailyRevenue-getDailyCosts())

func resetDailyRevenue() -> void:
	dailyRevenue = 0
	
func updateStats() -> void:
	endOfDayProfit()
	resetDailyRevenue()
	

	
func _ready() -> void:
	getDailyCosts()
	onInit.emit()
