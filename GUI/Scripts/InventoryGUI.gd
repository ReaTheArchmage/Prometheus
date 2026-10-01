class_name InventoryGUI extends HBoxContainer
@onready var equipment = Global.EQUIPMENT
@onready var instructions_box:VBoxContainer= $InvItemList/Instructions
@onready var weapons_box:VBoxContainer= $InvItemList/Weapons
@onready var equipment_box:HBoxContainer= $Equipment
const ITEM_BOX:PackedScene=preload("res://GUI/Scenes/ItemBox.tscn")
const SLOT_BOX:PackedScene=preload("res://GUI/Scenes/EquipSlot.tscn")

func _ready() -> void:
	GUIupdate()
	Global.GUIupdate.connect(GUIupdate)

func GUIupdate():
	await get_tree().create_timer(0.01).timeout
	updateInventoryGUI()
	updateEquipmentGUI()

func updateInventoryGUI()->void:
	updateInstrBox()
	updateWeapBox()

func updateInstrBox()->void:
	var inst_arr:Array[Instruction]= equipment.possessed_instructions
	for ch in instructions_box.get_children():ch.queue_free()
	for i in inst_arr:spawnItemBox(i,instructions_box)

func updateWeapBox():
	var weap_arr:Array[Weapon]= equipment.possessed_weapons
	for ch in weapons_box.get_children():ch.queue_free()
	for w in weap_arr:spawnItemBox(w,weapons_box)

func spawnItemBox(i:Item,box:Control)->void:
	var instance:ItemBox= ITEM_BOX.instantiate()
	box.add_child(instance)
	instance.item= i
	instance.label.text= i.item_name

func updateEquipmentGUI()->void:
	var equipped_instructions:Array[Instruction]= equipment.equipped_instructions
	for ch in equipment_box.get_children():ch.queue_free()
	for i in equipped_instructions.size():
		var instance:Node=SLOT_BOX.instantiate()
		equipment_box.add_child(instance)
		var slot:Node= instance.get_child(0)
		slot.index= i
		slot.label.text= (equipped_instructions[i].item_name
		) if equipped_instructions[i] != null else slot.label.text 
