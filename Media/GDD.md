
									**Game Design Document** 										
#name: 
*Prometheus*
#type: 
*2D Topdown Roguelike*
#core: 
*Combat, Buildcraft*

#description:
*Explore your surroundings and kill enemies to obtain items. Items are stored and can be equipped via the *
*inventory. There are 2 types of items: *
 
**1 Instuctions:**
  *Instructions are functions that control weapons, without an instruction you can't operate one. Each *
  *instruction has a number of slots, 0 to 3, into which the player can equip any weapon item, it also *
  *contain an attack type(orbiting, single attack...) that will be used to operate the weapons. Putting  *
  *an instruction into an instruction is possible, combining different moves together. *
**2 Weapons:**
  *Weapons only bare damage value, attack range and speed. *

*You have a limited amount of lives before dying. *

											**Codelist:**   												

**ITEM MANAGEMENT**
Resource: Instruction extends Item
	LoadedItems[]
	AtkStyle
	SlotItem(item), unslotItem(item)
Resource: Weapon extends Item
	Damage
	Ranging
	Speed

class: Inventory extends Node
	PossesedItems[Item]
	AddItem(item)
	ThrowItem(item)

	Class: Equipment extends Inventory (runtime object)
		EquippedItems[Item]
		EquipItemIn(item, slot_number)/UnequipIn(slot_number)
