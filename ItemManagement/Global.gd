extends Node
const ITEM_BOX:PackedScene= preload("res://GUI/Scenes/ItemBox.tscn")
const SLOT_BOX:PackedScene= preload("res://GUI/Scenes/EquipSlot.tscn")

@onready var EQUIPMENT:Equipment= get_tree(
).get_first_node_in_group("EQUIPMENT")
var selected_items:Array[Item]= []

@warning_ignore("unused_signal")signal GUIupdate()
