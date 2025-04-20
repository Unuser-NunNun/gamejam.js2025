extends Event

var Title: String = "Test Event A"
var Content: String = "Boat Goes Binted"

func _init() -> void:
	super(Title,Content)
	setOptions(true)
	addOption("Do Nothing")
	addOption("Play Dead")
	addOption("Boat Goes Binted")

func choosenOption(index: int) -> void:
	match index:
		0:
			print("Plays League")
		1:
			print("Gigi stands over you menacingly")
		2:
			print("Boat Goes Binted Knock Knock Knock")
		_:
			print("Invalid")
