///grid_add_new_key(get_grid_map,get_key,get_value)
var get_grid_map = argument0
var get_key = argument1
var get_value = argument2
show("grid map: " + string(argument0))
show("get key: " + argument1)
show("get value: " + string(argument0))

if is_zero(get_grid_map)
    {
    show("Error, grid map is undefined!")
    exit
    }

get_grid_map[? get_key] = get_value

var get_key_list = get_grid_map[? "key list"]

ds_list_add(get_key_list,get_key)
