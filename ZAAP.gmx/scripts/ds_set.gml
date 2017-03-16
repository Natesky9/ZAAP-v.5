///ds_set(get_map,get_key,get_value)
var get_map = argument0
var get_key = argument1
var get_value = argument2

if not ds_map_exists(get_map,get_key)
    {
    //if the map does not exist
    map_add_new_key(get_map,get_key,get_value)
    
    exit
    }
get_map[? get_key] = get_value

//show("key: " + string(get_key) + " set to: " + string(get_value))
