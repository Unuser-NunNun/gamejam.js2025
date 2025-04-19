extends InterestGroups
class_name StockholderInterestGroup


signal onLargeIncrease(margin: float)

signal onSmallIncrease(margin: float)

signal onStagnant(margin: float)

signal onSmallDecrease(margin: float)

signal onLargeDecrease(margin: float)


var checkedProfits: Array[float]

var upperBounds: Vector2 = Vector2(5,10)

var lowerBounds: Vector2 = Vector2(-10,-3)

var warnings: int = 1

var profitChecks: int = 5

func _init(rep: float) -> void:
	super(name,rep)
	checkedProfits.append(GameManager.getProfitsByDay(GameManager.getCurrentDay()))

func update() -> void:
	check(GameManager.getCurrentDay())

func check(day: int) -> void:
	if (day%profitChecks != 0):
		return
	checkedProfits.append(GameManager.getProfitsByDay(GameManager.getCurrentDay()))
	
	var previousProfit: float = checkedProfits.get(checkedProfits.size()-2)
	var currentProfit: float = checkedProfits.get(checkedProfits.size()-1)
	var margin: float = ((currentProfit-previousProfit)/previousProfit)*100
	
	if (margin >= upperBounds.y):
		onLargeDecrease.emit(margin)
		changeReputation(10)
	elif (margin >= upperBounds.x or margin < upperBounds.y):
		onSmallIncrease.emit(margin)
		changeReputation(5)
	elif (margin >= lowerBounds.y or margin < upperBounds.x):
		onStagnant.emit(margin)
		changeReputation(-3)
	elif (margin >= lowerBounds.x or margin < lowerBounds.y):
		onSmallDecrease.emit(margin)
		changeReputation(-8)
	else:
		onLargeDecrease.emit(margin)
		changeReputation(-15)

func addWarning() -> void:
	warnings -= 1
	if (warnings < 0):
		GameManager.onGameOver.emit("stockholder")
