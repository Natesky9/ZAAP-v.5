///entity_inventory_add(entity)
//adds a value to an entities inventory
var get_entity = argument0
var get_item = argument1
var get_quantity = argument2


var get_inventory = ds_get(get_entity,"inventory")

if is_zero(get_inventory)
    {
    show("This entity didn't have an inventory!")
    show("adding one now")
    
    get_inventory = ds_create(ds_type_list)
    ds_set(get_entity,"inventory",get_inventory)
    }
    
ds_list_add(get_inventory,get_item)

return true
