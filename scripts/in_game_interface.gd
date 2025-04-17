extends Control


func _on_button_pressed() -> void:
	GameManager.newDay()
	print(PlayerStatsManager.getTotalProfit())
	print(PlayerStatsManager.getDailyRevenue())
	print(PlayerStatsManager.getDailyCosts())
	print(GameManager.getMarginsByDay(GameManager.getCurrentDay()))
	print("\n")

func _ready() -> void:
	print(PlayerStatsManager.getTotalProfit())
	print(PlayerStatsManager.getDailyRevenue())
	print(PlayerStatsManager.getDailyCosts())
	print("\n")
