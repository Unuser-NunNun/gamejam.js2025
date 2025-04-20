extends Event

var Title: String = "Test Event B"
var Content: String = "Shiorin~"

func _init() -> void:
	super(Title,Content)
	setOptions(false)

func choosenOption(index: int) -> void:
	print(index)
	match index:
		_:
			print("*bricks you*")
