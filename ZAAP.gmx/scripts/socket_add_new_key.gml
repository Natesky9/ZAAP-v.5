///socket_add_new_key(map,key,value)

//REMOVE THIS
//to be removed in favor of ds_set

var get_map = argument0
var get_key = argument1
var get_value = argument2;

if get_map == 0
    {
    show("Error, entity is undefined!")
    exit
    }

get_map[? get_key] = get_value

var get_key_list = ds_map_find_value(get_map,"key list")

ds_list_add(get_key_list,get_key)

show("adding key [" + get_key + "] with value of [" + string(get_value) + "]")
