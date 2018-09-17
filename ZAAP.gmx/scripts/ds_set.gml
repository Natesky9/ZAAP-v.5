///ds_set(get_map,get_key,get_value,get_type)
var get_map = argument0
var get_key = argument1
var get_value = argument2
var get_type = argument3

var new_array;


if not ds_map_exists(get_map,get_key)
    {
    //if the map does not exist
    map_add_new_key(get_map,get_key,get_value,get_type)
    
    exit
    }
new_array[1] = get_value
new_array[0] = get_type

get_map[? get_key] = new_array

//show("key: " + string(get_key) + " set to: " + string(new_array))
