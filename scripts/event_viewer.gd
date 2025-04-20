extends Control

var displayedEvent: Event

func _ready() -> void:
	visible = false
	EventManager.onStartFirstEvent.connect(firstEvent)
	
func firstEvent() -> void:
	var event: Event = EventManager.getFirstEvent()
	if (!event):
		push_error("Error. No event is loaded")
		visible = false
		return
	setEvent(event)
	visible = true
	 
func setEvent(event: Event) -> void:
	displayedEvent = event
	eventChanged()
	
func eventChanged() -> void:
	$PanelContainer/MarginContainer/VBoxContainer/Title.text = displayedEvent.getTitle()
	$PanelContainer/MarginContainer/VBoxContainer/Content.text = displayedEvent.getContent()
	if (!displayedEvent.isHasOptions()):
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.visible = false
	else:
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.visible = true
		addOptions(displayedEvent.getAvilableOptions())

func addOptions(list: Array[String]) -> void:
	if (list.is_empty()):
		push_error("There's no options here")
		return
	for option in list:
		$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.add_item(option)
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.select(0)

func _on_button_pressed() -> void:
	var index: int = $PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.selected
	displayedEvent.choosenOption(index)
	setNextEvent()

func setNextEvent() -> void:
	$PanelContainer/MarginContainer/VBoxContainer/HBoxContainer/OptionButton.clear()
	var event = EventManager.getNextEvent()
	if (!event):
		noEvents()
		return
	setEvent(event)

func noEvents() -> void:
	visible = false
