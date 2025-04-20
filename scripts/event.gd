extends Node
class_name Event

var title: String
var content: String
var hasOptions: bool = true

var availableOptions: Array[String]

func _init(Title: String, Content:String) -> void:
	title = Title
	content = Content

func getTitle() -> String:
	return title

func getContent() -> String:
	return content

func setOptions(value: bool) -> void:
	hasOptions = value

func isHasOptions() -> bool:
	return hasOptions

func addOption(text: String) -> void:
	availableOptions.append(text)

func getAvilableOptions() -> Array[String]:
	return availableOptions

func choosenOption(index: int) -> void: #Override this one
	pass
