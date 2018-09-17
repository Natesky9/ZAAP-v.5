///ds_index(map,index)
//returns the value of the
//key at that point
//in the key list
var get_map = argument0
var get_index = argument1

var key_list = keys(get_map)

var get_key = ds_list_find_value(key_list,get_index)

return get_key
