class_name Box extends Control
var is_mouse_on:bool= false
var is_toggled:bool= false
var is_locked:bool= false
var index:int= 0
signal Pushed()

func connectMouse()->bool:
	mouse_entered.connect(onMouseEntered)
	mouse_exited.connect(onMouseExited)
	return true

@onready var connect_mouse:bool= connectMouse()

func trackSelection(event:InputEvent,lock:bool= false)->void:
	if is_mouse_on and event.is_action_pressed("select_box"):
		is_toggled = !is_toggled
		Pushed.emit(is_toggled)
		if lock:
			is_locked= true
			is_mouse_on= false

func updateSlot(i:Item,_idx:int)->void:
	self.text= i.item_name

func onMouseEntered():if!is_locked:is_mouse_on= true
func onMouseExited():is_mouse_on= false
