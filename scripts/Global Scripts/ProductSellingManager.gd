extends Node

var pricePerProduct: float = 10.00

func getPrice() -> float:
	return pricePerProduct

func changePrice(amount: int) -> void:
	if (amount < 0):
		pricePerProduct = max(pricePerProduct-amount,0)
		return
	pricePerProduct += amount

func sellProducts(amount: int) -> float:
	return amount * pricePerProduct
