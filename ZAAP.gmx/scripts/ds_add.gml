///ds_add(get_map,get_key,addition)
var get_map = argument0
var get_key = argument1
var get_addition = argument2
//this should only ever trigger on key.value

if not ds_map_exists(get_map,get_key)
    {
    //if the map does not exist
    map_add_new_key(get_map,get_key,get_value,key.value)
    show("key didn't exist #ds_add")
    exit
    }
var get_value = ds_get(get_map,get_key);
//show("value of key: " + get_key + " is: " + string(get_value))
get_value += get_addition

ds_set(get_map,get_key,get_value,key.value)

