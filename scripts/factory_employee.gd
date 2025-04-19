extends Employee
class_name FactoryEmployee

var outputAmount: int
var outputAmountMax: int = 40
var rawOreAmount: int = 0
var maxRawOreStorage: int = 40 
var createdPerEmployee: int = 6


func _init(Wage: float, Count: int) -> void:
	super("factory", Wage,Count)

func startTask() -> void:
	var remainingStorage: int = outputAmountMax - outputAmount
	if (rawOreAmount>=getEmployeeTotal()*createdPerEmployee):
		var createdAmount: int = min(remainingStorage,getEmployeeTotal()*createdPerEmployee)
		rawOreAmount -= createdAmount
		outputAmount += createdAmount
	else:
		print("Too much ore for remaining ore space. ditching some ore")
		var createdAmount: int = min(remainingStorage,rawOreAmount)
		rawOreAmount -= createdAmount
		outputAmount += createdAmount

	debug()
	onTaskCompleted.emit()

func getOutputMaxStorage() -> int:
	return outputAmountMax

func getRawOreMaxStorage() -> int:
	return maxRawOreStorage

func changeRawOreAmount(amount: int) -> void:
	if (amount < 0):
		rawOreAmount = max(rawOreAmount-amount,0)
	else:
		rawOreAmount = min(rawOreAmount+amount,maxRawOreStorage)
	print("Amount of Raw Ore in Storage before processing: " + str(rawOreAmount))

func changeRawOreMaxStorage(amount: int) -> void:
	if (amount < 0):
		maxRawOreStorage = max(maxRawOreStorage-amount,0)
		return
	maxRawOreStorage += amount

func changeMinedPerEmployee(amount: int) -> void:
	if (amount < 0):
		createdPerEmployee = max(createdPerEmployee-amount,0)
		return
	createdPerEmployee += amount

func changeOutputAmountMax(amount: int) -> void:
	if (amount < 0):
		outputAmountMax = max(outputAmountMax-amount,0)
		return
	outputAmountMax += amount
	
func getOutput() -> int:
	return outputAmount

func shipOutput(amount: int) -> int:
	if (outputAmount>=amount):
		outputAmount -= amount
		print("Unable to take all processed ore. Remaining Ore: " + str(outputAmount))
		return amount
	outputAmount = 0
	print("Unable to take all processed ore. Remaining Ore: " + str(outputAmount))
	return amount - outputAmount

func getMinedPerEmployee() -> int:
	return createdPerEmployee

func debug() -> void:
	print("Raw Ore in Storage: " + str(rawOreAmount) + "/" + str(getRawOreMaxStorage()))
	print("Processed Ore in Storage: " + str(outputAmount) + "/" + str(outputAmountMax))
