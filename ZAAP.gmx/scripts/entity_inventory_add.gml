///entity_inventory_add(uuid,item.id,quantity)
//adds items to an entity's inventory

var get_uuid = argument0
var get_item = argument1
var get_quantity = argument2

var get_entity = entity_from_uuid(get_uuid)

var get_current_quantity = ds_get(get_entity,get_item)

var new_quantity = get_current_quantity + get_quantity

ds_set(get_entity,get_item,new_quantity)
//packet_inventory_set
packet_write(packet.inventory_set,get_uuid,"item.triangle",new_quantity)
