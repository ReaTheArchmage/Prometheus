class_name Instruction extends Item
enum Atk{NONE,MELEE,ORBIT}
@export var slot_amt:int= 0
@export var attack_style:Atk= Atk.NONE
@export var slotted_items:Array[Item]
signal FromInstrToInv(i:Item,idx:int)

func slotItemAt(i:Item,idx:int)->void:
	if slotted_items.get(idx)== null:
		slotted_items[idx]= i
	else: push_error(
	"trying to insert  an item({i}) in a already used slot")

func unslotAt(_i:Item,idx:int)->void:
	if idx< slotted_items.size():
		FromInstrToInv.emit(slotted_items[idx],idx)
		slotted_items[idx]= null
	else: push_error(
	"trying to unslot an item out of bounds")

func _init()->void:
	for i in slot_amt-1:
		slotted_items[i]= null
