class_name ItemBox extends Box
@export var item:Item
@export var label: Label

func _ready()->void:
	Pushed.connect(OnPushed)

func _input(event:InputEvent)->void:
	trackSelection(event)

func OnPushed(toggle:bool)->void:
	if toggle: sendItemToGlobal()
	else: ereaseItemFromGlobal()

func sendItemToGlobal()->void:
	Global.selected_items.append(item)
	print(Global.selected_items)

func ereaseItemFromGlobal()->void:
	Global.selected_items.erase(item)
	print(Global.selected_items)

func _physics_process(_delta: float)->void:
	if is_toggled:dragAround()
	else:offset_transform_enabled= false

func dragAround(smoothness:float=0.7)->void:
	offset_transform_enabled= true
	var cursor_position:Vector2= get_global_mouse_position()
	offset_transform_position= lerp(
		offset_transform_position,cursor_position,smoothness)
