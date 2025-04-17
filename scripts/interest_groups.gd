extends Node
class_name InterestGroups

var reputation: float
var interestName: String

func _init(Name: String, Rep: float) -> void:
	reputation = Rep
	interestName = Name

func changeReputation(amount: float) -> void:
	if (amount < 0):
		reputation = max(reputation-amount,0)
		return
	reputation = min(reputation+amount,100)

func getName() -> String:
	return interestName.to_lower()

func getReputation() -> float:
	return reputation
