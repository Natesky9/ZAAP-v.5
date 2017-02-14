///map_add_new_key(get_entity,get_key,get_value)
var get_entity = argument0
var get_key = argument1
var get_value = argument2;

get_entity[? get_key] = get_value

var get_key_list = ds_get(get_entity,"key list")

ds_list_add(get_key_list,get_key)
