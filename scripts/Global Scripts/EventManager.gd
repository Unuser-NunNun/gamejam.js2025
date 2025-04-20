extends Node

signal onInit()

signal onStartFirstEvent()

var todayEvents: Array[Event]

func _ready() -> void:
	onInit.emit()

func updateEvents() -> void:
	onStartFirstEvent.emit()

func getFirstEvent() -> Event:
	return todayEvents.get(todayEvents.size()-1)
	
func addEvent(event: Event) -> void:
	todayEvents.append(event)

func getNextEvent() -> Event:
	todayEvents.remove_at(todayEvents.size()-1)
	if (todayEvents.is_empty()):
		return null
	return todayEvents.get(todayEvents.size()-1)
