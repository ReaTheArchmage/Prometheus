class_name Equipment extends Inventory
const SLOT_AMT:int= 4
var equipped_instructions:Array[Instruction]= [null,null,null,null]
signal FromEquipToInv()

func equipInstrInSlot(i:Instruction,slot:int)->void:
	if equipped_instructions[slot] == null:
		equipped_instructions[slot]= i
		throwItem(i)
		Global.selected_items.clear()
		print("instruction ",i.item_name," equipped in slot: ",slot,"\n")
	else: push_warning("slot is already used")

func unequipFromSlot(slot:int)->void:
	FromEquipToInv.emit(equipped_instructions[slot])
	equipped_instructions[slot]= null

func connectMethods()->bool:
	var pairs:Dictionary[StringName,Array]= {
		&"FromInvToEquip":[equipInstrInSlot,throwItem],
		&"FromEquipToInv":[addItem,unequipFromSlot]}
	var k:Array[StringName]= pairs.keys()
	for x in 4: match x:
		0,1: connect(k[0], pairs[k[0]][x])
		2,3: connect(k[1], pairs[k[1]][x-2])
	return true

@onready var connect_methods:bool= connectMethods()
