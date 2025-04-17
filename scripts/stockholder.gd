extends InterestGroups
class_name StockholderInterestGroup


var profitMarginsCheck: int

var checkedProfits: Array[float]

func _init(rep: float, checks: int, warnings: int) -> void:
	super(name,rep)
	profitMarginsCheck = checks
	
	GameManager.onNewDay.connect(check)
	checkedProfits.append(GameManager.getProfitsByDay(GameManager.getCurrentDay()))

func check(day: int) -> void:
	if (day%profitMarginsCheck != 0):
		return

	var previousProfit: float = checkedProfits.get(checkedProfits.size()-2)
	var currentProfit: float = checkedProfits.get(checkedProfits.size()-1)
	
