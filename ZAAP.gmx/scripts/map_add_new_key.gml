///map_add_new_key(get_map,get_key,get_value,get_type)
var get_map = argument0
var get_key = argument1
var get_value = argument2
var get_type = argument3;


//change this to detect and filter different key types

var new_array;
new_array[1] = 0;
new_array[0] = get_type
new_array[1] = get_value

get_map[? get_key] = new_array
//ds_map_add(get_map,get_key,new_array)


var get_key_list = keys(get_map)

ds_list_add(get_key_list,get_key)

show("added new key: " + string(get_key) + " as value: " + string(new_array))
