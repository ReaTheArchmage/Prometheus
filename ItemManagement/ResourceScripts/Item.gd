class_name Item extends Resource
@export var item_name:String= ""
@export var quantity:int= 1

func _init()->void:
	assert(item_name==""or item_name==" ",
	"Invalid resource name")
	resource_name=item_name
