extends Employee
class_name ShipperEmployee

var amountPerEmployee: int = 10

func _init(Wage: float, Count: int) -> void:
	super("shipper",Wage,Count);

func startTask(amount: int) -> void:
	var profit: float = ProductSellingManager.sellProducts(amount)
	PlayerStatsManager.addDailyRevenue(profit)
	debug(amount,profit)
	onTaskCompleted.emit()

func changeAmountPerEmployee(amount: int) -> void:
	if (amount < 0):
		amountPerEmployee = max(amountPerEmployee-amount,0)
	amountPerEmployee += amount

func getAmountPerEmployee() -> int:
	return amountPerEmployee

func getCollectionAmount() -> int:
	return getEmployeeTotal()*amountPerEmployee

func debug(amount: int, profit: float) -> void:
	print("Remaining Products in Storage: " + str(EmployeeManager.getFactoryEmployee().getOutput()))
	print("product collected: " + str(amount))
	print("profit: " + str(profit))
	
