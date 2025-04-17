extends Node

signal onInit()

func _ready() -> void:
	onInit.emit()
