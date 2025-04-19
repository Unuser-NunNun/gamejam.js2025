extends Node

signal onNewDay(newDay: int)
signal onThresholdPassed()
signal onInit()
signal onGameOver(type: String)

var currentDay: int = 1

var profitsByDay: Array[float]
var marginsByDay: Array[float]
var maxDay: int = 30

func newDay() -> void:
	currentDay += 1
	if (currentDay > maxDay):
		onThresholdPassed.emit()
		markProfits()
		return
	markProfits()
	EmployeeManager.updateEmployees()
	PlayerStatsManager.updateStats()
	onNewDay.emit(currentDay)
	

func getCurrentDay() -> int:
	return currentDay

func getProfitsByDay(index: int) -> float:
	return profitsByDay.get(index-1)

func getMarginsByDay(index: int) -> float:
	return marginsByDay.get(index-1)

func markProfits() -> void:
	profitsByDay.append(PlayerStatsManager.getTotalProfit())
	var margins: float = ((getProfitsByDay(currentDay)-getProfitsByDay(currentDay-1))/getProfitsByDay(currentDay-1))*100
	marginsByDay.append(margins)

func gameOver(type: String) -> void:
	pass

func _ready() -> void:
	profitsByDay.append(PlayerStatsManager.getTotalProfit())
	marginsByDay.append(0.00)
	onGameOver.connect(gameOver)
	onInit.emit()
