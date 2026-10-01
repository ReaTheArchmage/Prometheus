extends Node
var selected_items:Array[Item]= []
@onready var EQUIPMENT:Equipment= get_tree().get_first_node_in_group("EQUIPMENT")

signal GUIupdate()
