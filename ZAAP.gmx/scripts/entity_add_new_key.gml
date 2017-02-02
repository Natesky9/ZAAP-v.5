///entity_add_new_key(get_entity,get_key,get_value)
var get_entity = argument0
var get_key = argument1
var get_value = argument2;

if get_entity == 0
    {
    show("Error, entity is undefined!")
    exit
    }

get_entity[? get_key] = get_value

var get_key_list = ds_map_find_value(get_entity,"key list")

ds_list_add(get_key_list,get_key)
