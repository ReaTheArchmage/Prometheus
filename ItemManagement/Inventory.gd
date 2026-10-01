class_name Inventory extends Node
@export var possessed_weapons:Array[Weapon]= []
@export var possessed_instructions:Array[Instruction]= []
signal FromInvToEquip(i:Item,index:int)

func addItem(item)->void:
	if item is Instruction:possessed_instructions.append(item)
	elif item is Weapon:possessed_instructions.append(item)

func throwItem(item,_idx:int= 0)->void:
	if item is Instruction:possessed_instructions.erase(item)
	elif item is Weapon:possessed_instructions.erase(item)
