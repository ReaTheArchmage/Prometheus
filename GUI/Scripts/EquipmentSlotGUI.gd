class_name EquipmentSlot extends Box
var G= Global
@export var label:Label

func _input(event:InputEvent)->void:
	trackSelection(event,true)
	if not G.selected_items.is_empty() and is_toggled:
		emitToInv()

func emitToInv():
		for i in G.selected_items:
			if i is Instruction and G.selected_items.size()== 1:
				Global.EQUIPMENT.emit_signal(&"FromInvToEquip",i,index)
			else:push_warning("Only 1 instruction item can be equipped here.")
		Global.GUIupdate.emit()
		is_toggled= false
